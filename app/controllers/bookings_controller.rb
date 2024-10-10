class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @instrument = @booking.instrument
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = @instrument.bookings.build(booking_params.merge(user_id: current_user.id))

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render 'instruments/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:dates_range)
  end
end
