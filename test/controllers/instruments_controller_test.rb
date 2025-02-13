require "test_helper"

class InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instruments_url
    assert_response :success
  end

  test "should get show" do
    get instrument_url(Instrument.last)
    assert_response :success
  end
end
