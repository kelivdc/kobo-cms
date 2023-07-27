require "test_helper"

class Cms::ParticipantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cms_participant_index_url
    assert_response :success
  end
end
