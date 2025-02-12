require "application_system_test_case"

class InstrumentsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit instruments_url
    save_and_open_screenshot
    assert_selector "h5"
  end
end
