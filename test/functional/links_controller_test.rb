require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should return final urls in rest api" do
    get :process_url_details, {:id => 1}
    assert_response :success
  end
  
  test "should return page title" do
    get :get_page_title, {:id => 1}
    assert_response :success
    assert_select 'span'
  end
end
