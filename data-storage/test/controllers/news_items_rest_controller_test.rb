require 'test_helper'

class NewsItemsRestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_items_rest_index_url
    assert_response :success
  end

end
