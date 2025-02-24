require "application_system_test_case"

class InstrumentBookingsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @instrument = instruments(:violin)
    photo_path = Rails.root.join("db/seed_images/Violin.jpg")
    @instrument.photos.attach(io: File.open(photo_path), filename: File.basename(photo_path))
  end

  test "booking an instrument" do
    # Sign in as a user
    sign_in users(:pablo)

    # Visit the homepage
    visit root_path

    # Put in a Search Word
    fill_in "Instrument", with: "Violin"

    # Fill in FLatpickr date fields
    # Ensure the Flatpickr inputs are present
    assert_selector "#start_date", visible: true
    assert_selector "#end_date", visible: true

    # Open the Flatpickr start_date picker
    find("#start_date").click

    # Wait for the Flatpickr date picker to appear
    assert_selector ".flatpickr-calendar", visible: true

    # Select a start_date
    date_to_select = Date.today.strftime("%Y-%m-%d")
    within ".flatpickr-calendar" do
      find(".flatpickr-day[aria-label='#{Date.today.strftime("%B %d, %Y")}']").click
    end

    # Verify the selected date is displayed in the input field
    assert_equal date_to_select, find("#start_date").value

    # Open the Flatpickr end_date picker
    find("#end_date").click

    # Wait for the Flatpickr date picker to appear
    assert_selector ".flatpickr-calendar", visible: true

    # Select a start_date
    date_to_select = (Date.today + 2).strftime("%Y-%m-%d")
    within ".flatpickr-calendar" do
      find(".flatpickr-day[aria-label='#{(Date.today + 2).strftime("%B %d, %Y")}']").click
    end

    # Verify the selected date is displayed in the input field
    assert_equal date_to_select, find("#end_date").value

    # Perform a search
    click_button "Search"

    # Choose an instrument
    click_link "old Violin"

    # Verify instrument booking period is defined
    assert_no_selector ".booking-cta > a", text: "Define Booking Period"

    # Book the instrument
    click_button "Book"

    # Confirm booking
    click_button "Confirm Booking"

    # Commit to pay
    click_link "Commit to Pay"

    # Verify booking is now in pending tab of users bookings
    assert_selector "h4", text: "Pending"
    assert_selector ".details", text: "old Violin"
  end
end
