require "test_helper"

class Dashboard::ParticipantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_participant_index_url
    assert_response :success
  end
end
