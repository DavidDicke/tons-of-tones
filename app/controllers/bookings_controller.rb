class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :show_alternative]
  before_action :update_completed_bookings

  def index
    @user_bookings = current_user.bookings
    @instruments = current_user.instruments
    @instrument_bookings = @instruments.includes(:bookings).flat_map do |instrument|
      instrument.bookings
    end
  end

  def show
    @instrument = @booking.instrument
  end

  def show_alternative
    @instrument = @booking.instrument
    render :show_alternative
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = @instrument.bookings.new(booking_params)
    @booking.user_id = current_user.id if current_user.present?

    if @booking.start_date.blank? || @booking.end_date.blank?
      flash[:alert] = "Both start and end dates must be provided."
      render 'instruments/show', status: :unprocessable_entity and return
    end

    if @booking.end_date < @booking.start_date
      flash[:alert] = "End date cannot be before start date."
      render 'instruments/show', status: :unprocessable_entity and return
    end

    if overlapping_bookings?(@instrument, @booking.start_date, @booking.end_date)
      flash[:alert] = "Booking dates overlap with an existing booking."
      render 'instruments/show', status: :unprocessable_entity and return
    end

    number_of_days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = number_of_days * @instrument.price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'instruments/show', status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      if @booking.cancelled?
        flash[:notice] = "Booking was successfully cancelled."
      elsif @booking.confirmed?
        flash[:notice] = "Booking was successfully confirmed."
      else
        flash[:notice] = "Booking was successfully updated."
      end
      redirect_back(fallback_location: root_path)
    else
      render :edit, alert: 'There was an issue updating the booking.'
    end
  end

  def user_bookings
    @user_bookings = current_user.bookings.includes(:instrument)
  end

  def instrument_bookings
    @instrument_bookings = Booking.includes(:instrument).where(instrument: current_user.instruments)
  end

  def confirmed_bookings
    # Retrieve the notified booking IDs from the session, or initialize an empty array
    notified_booking_ids = session[:notified_booking_ids] || []

    # Fetch the confirmed bookings updated within the last minute
    @confirmed_bookings = current_user.bookings.where(status: "confirmed")
                                                .where('updated_at > ?', 1.minute.ago)

    # Filter out already notified bookings
    new_confirmed_bookings = @confirmed_bookings.reject do |booking|
      notified_booking_ids.include?(booking.id)
    end

    # Update the notified booking IDs to include the newly confirmed bookings
    notified_booking_ids.concat(new_confirmed_bookings.map(&:id))
    session[:notified_booking_ids] = notified_booking_ids.uniq # Store back to session

    render json: new_confirmed_bookings # Return only new confirmed bookings
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def overlapping_bookings?(instrument, start_date, end_date)
    instrument.bookings.where.not(id: @booking.id)
      .where("start_date < ? AND end_date > ? AND status != ?", end_date, start_date, 3)
      .exists?
  end

  def update_completed_bookings
    Booking.where('end_date < ? AND status = ?', Time.current, 2).find_each do |booking|
      booking.update(status: :completed)
    end
  end
end
