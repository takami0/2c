require "test_helper"

class Admin::FollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_followers_index_url
    assert_response :success
  end
end
