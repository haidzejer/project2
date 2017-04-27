require 'test_helper'

class HeartControllerTest < ActionDispatch::IntegrationTest
  test "should get heart" do
    get heart_heart_url
    assert_response :success
  end

  test "should get unheart" do
    get heart_unheart_url
    assert_response :success
  end

end
