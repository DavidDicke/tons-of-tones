require "test_helper"

class UserReviewTest < ActiveSupport::TestCase
  test "should not save a Review without a Rating" do
    review = UserReview.new(content: "Great", user: users(:pablo), booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a Rating"
  end

  test "should not save a Review without a Content" do
    review = UserReview.new(rating: 5, user: users(:pablo), booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a Content"
  end

  test "should not save a Review without a User" do
    review = UserReview.new(rating: 5, content: "Great", booking: bookings(:second_booking))
    assert_not review.save, "Saved the Review without a User"
  end

  test "should not save a Review without a Booking" do
    review = UserReview.new(rating: 5, content: "Great", user: users(:pablo))
    assert_not review.save, "Saved the Review without a Booking"
  end

  test "should not save a Review when the users has already reviewed the Booking" do
    review1 = UserReview.new(
      rating: 5,
      content: "Great",
      user: users(:pablo),
      booking: bookings(:second_booking)
    )
    assert review1.save, "Did not save the first Review"

    review2 = UserReview.new(
      rating: 5,
      content: "Also Great",
      user: users(:pablo),
      booking: bookings(:second_booking)
    )
    assert_not review2.save, "Saved teh second Review allthough the users has already reviewed the Booking"
  end

  test "user review belongs to a user" do
    review = user_reviews(:first_user_review)
    assert_instance_of User, review.user, "Review does not belong to a User"
  end

  test "user review belongs to a booking" do
    review = user_reviews(:first_user_review)
    assert_instance_of Booking, review.booking, "Review does not belong to a Booking"
  end
end
