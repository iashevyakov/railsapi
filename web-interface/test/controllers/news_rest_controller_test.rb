require 'test_helper'

class NewsRestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_rest_index_url
    assert_response :success
  end

  test "should get show" do
    get news_rest_show_url
    assert_response :success
  end

end
