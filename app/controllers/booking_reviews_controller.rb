class BookingReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])

    if @booking.booking_review.present?
      redirect_to instrument_path(@booking.instrument), notice: 'You have already submitted a review for this booking.'
    else
      @booking_review = @booking.build_booking_review
    end
  end

  def create
    @booking = Booking.find(params[:booking_id])

    if @booking.booking_review.present?
      redirect_to instrument_path(@booking.instrument), notice: 'You have already submitted a review for this booking.'
    else
      @booking_review = @booking.build_booking_review(booking_review_params)
      @booking_review.user = current_user

      if @booking_review.save
        redirect_to instrument_path(@booking.instrument), notice: 'Review added successfully.'
      else
        redirect_to instrument_path(@booking.instrument), alert: @booking_review.errors.full_messages.to_sentence
      end
    end
  end

  private

  def booking_review_params
    params.require(:booking_review).permit(:content, :rating)
  end
end
