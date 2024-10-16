class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews_about_me = @user.bookings.includes(:user_review).map(&:user_review).compact
    @reviews_by_me = @user.booking_reviews
  end
end
