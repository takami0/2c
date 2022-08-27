require "test_helper"

class Admin::CategoryMotifsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_category_motifs_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_category_motifs_edit_url
    assert_response :success
  end
end
