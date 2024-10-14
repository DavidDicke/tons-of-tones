class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]
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

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = @instrument.bookings.new(booking_params)
    @booking.user_id = current_user.id if current_user.present?

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
