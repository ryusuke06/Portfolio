require 'test_helper'

class Admins::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_categories_index_url
    assert_response :success
  end

end
