require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "the booking belongs to a user" do
    booking = bookings(:first_booking)
    assert_instance_of User, booking.user, "Booking does not belong to a User"
  end

  test "the booking belongs to an instrument" do
    booking = bookings(:first_booking)
    assert_instance_of Instrument, booking.instrument, "Booking does not belong to an Instrument"
  end

  test "the booking has one booking review" do
    booking = bookings(:first_booking)
    assert_instance_of BookingReview, booking.booking_review, "Booking does not have a Booking Review"
  end

  test "the booking has one user review" do
    booking = bookings(:first_booking)
    assert_instance_of UserReview, booking.user_review, "Booking does not have a User Review"
  end

  test "the booking does not save without a start_date" do
    booking = Booking.new(end_date: Date.today, user: users(:pablo), instrument: instruments(:violin))
    assert_not booking.save, "Saved the Booking without a start_date"
  end

  test "the booking does not save without an end_date" do
    booking = Booking.new(start_date: Date.today, user: users(:pablo), instrument: instruments(:violin))
    assert_not booking.save, "Saved the Booking without an end_date"
  end

  test "the booking have a valid status value" do
    assert_raises(ArgumentError) do
      booking = Booking.new(start_date: Date.today, end_date: Date.today, user: users(:pablo), instrument: instruments(:violin), status: "undefined")
    end
  end

  test "the booking have a default status value" do
    booking = Booking.new(start_date: Date.today, end_date: Date.today, user: users(:pablo), instrument: instruments(:violin))
    assert_equal 'pending', booking.status, "Booking does not have a default status pending"
  end

  test "should allow setting status to confirmed" do
    booking = bookings(:first_booking)
    booking.status = 'confirmed'
    assert booking.save, "Did not save the Booking with status confirmed"
  end

  test "should allow setting status to cancelled" do
    booking = bookings(:first_booking)
    booking.status = 'cancelled'
    assert booking.save, "Did not save the Booking with status cancelled"
  end

  test "should allow setting status to completed" do
    booking = bookings(:first_booking)
    booking.status = 'completed'
    assert booking.save, "Did not save the Booking with status completed"
  end

  test "should allow setting status to confirm_viewed" do
    booking = bookings(:first_booking)
    booking.status = 'confirm_viewed'
    assert booking.save, "Did not save the Booking with status confirm_viewed"
  end
end
