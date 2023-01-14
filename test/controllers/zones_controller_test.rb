require "test_helper"

class ZonesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get zones_new_url
    assert_response :success
  end

  test "should get create" do
    get zones_create_url
    assert_response :success
  end
end
