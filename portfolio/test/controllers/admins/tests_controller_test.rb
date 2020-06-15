require 'test_helper'

class Admins::TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get preview" do
    get admins_tests_preview_url
    assert_response :success
  end

end
