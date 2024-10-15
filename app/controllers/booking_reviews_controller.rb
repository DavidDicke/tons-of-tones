class BookingReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @booking_review = @booking.booking_reviews.build
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @booking_review = @booking.booking_reviews.new(booking_review_params)
    @booking_review.user = current_user

    if @booking_review.save
      redirect_to instrument_path(@booking.instrument), notice: "Review added successfully."
    else
      # Redirect with an error message if the review is not saved
      redirect_to instrument_path(@booking.instrument), alert: @booking_review.errors.full_messages.to_sentence
    end
  end

  private

  def booking_review_params
    params.require(:booking_review).permit(:content, :rating)
  end
end
