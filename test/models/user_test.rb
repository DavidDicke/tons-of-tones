require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:blank_user)
    @booking1 = Booking.create!(
      status: 1,
      total_price: 100,
      instrument: instruments(:violin),
      user: @user,
      start_date: Date.today,
      end_date: Date.today + 1
    )
    @booking2 = Booking.create!(
      status: 1,
      total_price: 200,
      instrument: instruments(:violin),
      user: @user,
      start_date: Date.today - 10,
      end_date: Date.today - 8
    )
  end

  test "user has one attached photo" do
    assert_instance_of ActiveStorage::Attached::One, @user.photo, "User does not have a photo"
  end

  test "user has many instruments" do
    instrument1 = Instrument.create!(
      name: "Violoncello",
      description: "A beautiful violoncello",
      category: "string",
      address: "123 Main St",
      price: 100,
      user: @user
    )
    instrument2 = Instrument.create!(
      name: "old Violoncello",
      description: "A great violoncello",
      category: "string",
      address: "456 Main St",
      price: 200,
      user: @user
    )
    assert_equal [instrument1, instrument2], @user.instruments, "User does not have many instruments"
  end

  test "user has many bookings" do
    assert_equal [@booking1, @booking2], @user.bookings, "User does not have many bookings"
  end

  test "user has many booking reviews" do
    booking_review1 = BookingReview.create!(
      content: "Great instrument",
      rating: 5,
      user: @user,
      booking: @booking1
    )
    booking_review2 = BookingReview.create!(
      content: "Good instrument",
      rating: 4,
      user: @user,
      booking: @booking2
    )
    assert_equal [booking_review1, booking_review2], @user.booking_reviews, "User does not have many booking reviews"
  end

  test "user has many user reviews" do
    user_review1 = UserReview.create!(
      content: "Great renter",
      rating: 5,
      user: @user,
      booking: @booking1
    )
    user_review2 = UserReview.create!(
      content: "Good renter",
      rating: 4,
      user: @user,
      booking: @booking2
    )
    assert_equal [user_review1, user_review2], @user.user_reviews, "User does not have many user reviews"
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
