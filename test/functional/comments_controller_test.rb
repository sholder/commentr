require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def test_get_view_widget_xml
    get :list, {:page => pages(:nv_session_1).id, :format => :xml}
    assert_response :success
    assert_equal('test', @response.body)
  end
end
