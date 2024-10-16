class UserReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])

    if @booking.user_review.present?
      flash.now[:notice] = 'You have already submitted a review for this user.'
      redirect_to instrument_bookings_bookings_path and return
    else
      @user_review = @booking.build_user_review
    end
  end

  def create
    @booking = Booking.find(params[:booking_id])

    if @booking.user_review.present?
      redirect_to instrument_bookings_bookings_path, notice: 'You have already reviewed this user for this booking'
    else
      @user_review = @booking.build_user_review(user_review_params)
      @user_review.user = current_user

      if @user_review.save
        redirect_to instrument_bookings_bookings_path, notice: 'Review added successfully.'
      else
        render 'new'
      end
    end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:content, :rating)
  end
end
