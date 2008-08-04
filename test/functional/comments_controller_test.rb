require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  # TODO(sholder) test routing

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
  
  def test_create_comment
    xhr(:post, :create, {:comment => {:page_id => pages(:nv_session_1).id, :text => 'a new comment', :nickname => 'sholder'}})
    assert_not_nil(assigns(:comment))
    assert_not_nil(Comment.find(assigns(:comment).id))
    assert_response :success
    assert_select_rjs :update, :top, "comments"
  end
  
  # TODO(sholder) tests for when create fails
end
