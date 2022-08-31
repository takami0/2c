require "test_helper"

class Public::FollowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_followings_index_url
    assert_response :success
  end
end
