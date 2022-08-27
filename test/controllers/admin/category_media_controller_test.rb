require "test_helper"

class Admin::CategoryMediaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_category_media_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_category_media_edit_url
    assert_response :success
  end
end
