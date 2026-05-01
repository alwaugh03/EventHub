require "test_helper"

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrators_index_url
    assert_response :success
  end

  test "should get show" do
    get administrators_show_url
    assert_response :success
  end
end
