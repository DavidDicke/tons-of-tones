require "test_helper"

class BookingReviewTest < ActiveSupport::TestCase
  test "should not save a Review without a Rating" do
    review = BookingReview.new(content: "Great", user: users(:pablo), booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a Rating"
  end

  test "should not save a Review without a Content" do
    review = BookingReview.new(rating: 5, user: users(:pablo), booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a Content"
  end

  test "should not save a Review without a User" do
    review = BookingReview.new(rating: 5, content: "Great", booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a User"
  end

  test "should not save a Review without a Booking" do
    review = BookingReview.new(rating: 5, content: "Great", user: users(:pablo))
    assert_not review.save, "Saved the Review without a Booking"
  end

  test "should not save a Review when the users has already reviewed the Booking" do
    review1 = BookingReview.new(
      rating: 5,
      content: "Great",
      user: users(:pablo),
      booking: bookings(:second_booking)
    )
    assert review1.save, "Did not save the first Review"

    review2 = BookingReview.new(
      rating: 5,
      content: "Also Great",
      user: users(:pablo),
      booking: bookings(:second_booking)
    )
    assert_not review2.save, "Saved teh second Review allthough the users has already reviewed the Booking"
  end

  test "booking review belongs to a user" do
    review = booking_reviews(:first_booking_review)
    assert_instance_of User, review.user, "Review does not belong to a User"
  end

  test "booking review belongs to a booking" do
    review = booking_reviews(:first_booking_review)
    assert_instance_of Booking, review.booking, "Review does not belong to a Booking"
  end
end
