require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def test_get_view_html
    get :list, {:page => pages(:nv_session_1).id}
    assert_response :success
    assert_template 'list'
    assert_not_nil assigns(:comments)
    assert_equal(3, assigns(:comments).length)
    assert_select 'div' do
      assert_select 'div.comment', :count => 3
    end
  end

  def test_get_view_widget_xml
    get :list, {:page => pages(:nv_session_1).id, :format => 'xml'}
    assert_response :success
    assert_match(/#{comments(:clay).text}/, @response.body)
    assert_match(/#{comments(:kisu).nickname}/, @response.body)
    # TODO(sholder) some assertions about the validity of the XML
  end
end
