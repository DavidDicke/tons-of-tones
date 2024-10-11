class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
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

    number_of_days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = number_of_days * @instrument.price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'instruments/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
