require "test_helper"

class Admin::FollowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_followings_index_url
    assert_response :success
  end
end
