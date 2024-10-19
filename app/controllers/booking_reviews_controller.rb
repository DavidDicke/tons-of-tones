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
      redirect_to user_bookings_bookings_path, notice: 'You have already submitted a review for this booking.'
    else
      @booking_review = @booking.build_booking_review(booking_review_params)
      @booking_review.user = current_user

      if @booking_review.save
        redirect_to booking_booking_review_path(@booking, @booking_review), notice: 'Review added successfully.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @booking_review = BookingReview.find(params[:id])
  end

  private

  def booking_review_params
    params.require(:booking_review).permit(:content, :rating)
  end
end
