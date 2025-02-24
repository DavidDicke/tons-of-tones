require "application_system_test_case"

class LoginUsersTest < ApplicationSystemTestCase
  test "login a user" do
    # Visit the homepage
    visit root_path
    assert_selector "h1", text: "Tons of Tones lets you play any Instrument in Berlin*"

    # Login the user
    click_on "Login"
    fill_in "Email", with: "test@pablo-guelfi.de"
    fill_in "Password", with: "123456"
    click_button "Log in"

    # Verify user is logged in
    assert_equal "Pablo Guelfi Placeholder Picture", find("img.avatar")[:alt]
  end
end
