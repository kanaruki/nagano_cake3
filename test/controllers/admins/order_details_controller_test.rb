require 'test_helper'

class Admins::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_order_details_show_url
    assert_response :success
  end

  test "should get update" do
    get admins_order_details_update_url
    assert_response :success
  end

end
