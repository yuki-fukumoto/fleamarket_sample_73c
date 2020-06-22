require 'test_helper'

class TopPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_page_index_url
    assert_response :success
  end

end
