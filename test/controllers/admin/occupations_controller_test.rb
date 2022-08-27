require "test_helper"

class Admin::OccupationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_occupations_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_occupations_edit_url
    assert_response :success
  end
end
