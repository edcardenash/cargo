require "test_helper"

class CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cities_new_url
    assert_response :success
  end

  test "should get create" do
    get cities_create_url
    assert_response :success
  end
end
