require "test_helper"

class ArtikelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artikel_index_url
    assert_response :success
  end
end
