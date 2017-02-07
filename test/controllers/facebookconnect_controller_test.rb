require 'test_helper'

class FacebookconnectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facebookconnect_index_url
    assert_response :success
  end

end
