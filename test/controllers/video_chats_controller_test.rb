require 'test_helper'

class VideoChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get video_chats_top_url
    assert_response :success
  end

end
