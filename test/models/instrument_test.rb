require "test_helper"

class InstrumentTest < ActiveSupport::TestCase
  test "instrument belongs to a user" do
    instrument = instruments(:violin)
    assert_instance_of User, instrument.user, "Instrument does not belong to a User"
  end

  test "instrument has many bookings" do
    instrument = instruments(:violin)
    assert_instance_of Booking, instrument.bookings.first, "Instrument does not have any Bookings"
  end

  test "instrument has many booking reviews" do
    instrument = instruments(:violin)
    assert_instance_of BookingReview, instrument.booking_reviews.first, "Instrument does not have any Booking Reviews"
  end

  test "instrument has many photos" do
    instrument = instruments(:violin)
    assert_instance_of ActiveStorage::Attached::Many, instrument.photos, "Instrument does not have any Photos"
  end

  test "instrument does not save without a name" do
    instrument = Instrument.new(
      description: "A beautiful violin",
      category: "string",
      address: "123 Main St",
      price: 100,
      user: users(:pablo)
    )
    assert_not instrument.save, "Saved the Instrument without a name"
  end

  test "instrument does not save without a description" do
    instrument = Instrument.new(
      name: "Violin",
      category: "string",
      address: "123 Main St",
      price: 100,
      user: users(:pablo)
    )
    assert_not instrument.save, "Saved the Instrument without a description"
  end

  test "instrument does not save without a category" do
    instrument = Instrument.new(
      name: "Violin",
      description: "A beautiful violin",
      address: "123 Main St",
      price: 100,
      user: users(:pablo)
    )
    assert_not instrument.save, "Saved the Instrument without a category"
  end

  test "instrument does not save without an address" do
    instrument = Instrument.new(
      name: "Violin",
      description: "A beautiful violin",
      category: "string",
      price: 100,
      user: users(:pablo)
    )
    assert_not instrument.save, "Saved the Instrument without an address"
  end

  test "instrument does not save without a price that is a number greater than or equal to 0" do
    instrument = Instrument.new(
      name: "Violin",
      description: "A beautiful violin",
      category: "string",
      address: "123 Main St",
      user: users(:pablo),
      price: -1
    )
    assert_not instrument.save, "Saved the Instrument without a price"
  end

  test "instrument does not save without a price that is string" do
    instrument = Instrument.new(
      name: "Violin",
      description: "A beautiful violin",
      category: "string",
      address: "123 Main St",
      user: users(:pablo),
      price: "one"
    )
    assert_not instrument.save, "Saved the Instrument without a price"
  end
end
