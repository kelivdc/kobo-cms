require "test_helper"

class Cms::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cms_dashboard_index_url
    assert_response :success
  end
end
