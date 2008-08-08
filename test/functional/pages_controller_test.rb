require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  def test_page_routing
    page_id = pages(:nv_session_1).id
    assert_generates "/pages/#{page_id}/comments", 
                      :controller => 'comments', :action => 'index', 
                      :page_id => page_id
    assert_recognizes({'controller' => 'comments', 'action' => 'index', 'page_id' => page_id.to_s}, 
                      "/pages/#{page_id}/comments")
  end
end
