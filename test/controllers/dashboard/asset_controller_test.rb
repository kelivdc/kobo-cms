require "test_helper"

class Dashboard::AssetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_asset_index_url
    assert_response :success
  end
end
