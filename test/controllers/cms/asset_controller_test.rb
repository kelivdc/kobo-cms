require "test_helper"

class Cms::AssetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cms_asset_index_url
    assert_response :success
  end
end
