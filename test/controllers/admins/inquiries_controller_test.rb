require 'test_helper'

class Admins::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get admins/index" do
    get admins_inquiries_admins/index_url
    assert_response :success
  end

  test "should get admins/show" do
    get admins_inquiries_admins/show_url
    assert_response :success
  end

end
