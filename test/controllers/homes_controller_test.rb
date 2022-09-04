require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get search" do
    get searches_search_url
    assert_response :success
  end

  test "should get result" do
    get searches_result_url
    assert_response :success
  end

end
