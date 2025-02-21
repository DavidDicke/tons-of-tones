require "application_system_test_case"

class InstrumentSearchesTest < ApplicationSystemTestCase
  test "searching for an instrument" do
    # Visit the homepage
    visit root_path
    assert_selector "h1", text: "Tons of Tones lets you play any Instrument in Berlin*"

    # Perform a search
    fill_in "Instrument", with: "Violin"
    fill_in "start_date", with: "2026-10-01"
    fill_in "end_date", with: "2026-10-10"
    click_button "Search"

    # Verify search results
    assert_selector ".instruments-card", count: 1
  end
end
