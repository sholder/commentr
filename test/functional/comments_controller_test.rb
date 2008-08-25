require 'test_helper'

class CommentsControllerTest < ActionController::TestCase


  def test_create_comment
    xhr(:post, :create, {:comment => {:page_id => pages(:nv_session_1).id, :text => 'a new comment', :nickname => 'sholder'}})
    assert_not_nil(assigns(:comment))
    assert_not_nil(Comment.find(assigns(:comment).id))
    assert_response :success
    #assert_select_rjs :insert, :top, 'comment_list'
  end
  
  def test_get_view_html
    page_id = pages(:nv_session_1).id
    get :index, {:page_id => page_id}
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:comments)
    assert_equal(3, assigns(:comments).length)
    assert_select 'div#comment_list' do
      assert_select 'div.comment', :count => 3
    end
  end

  def test_get_view_widget_xml
    get :index, {:page_id => pages(:nv_session_1).id, :format => 'xml'}
    assert_response :success
    assert_match(/#{comments(:clay).text}/, @response.body)
    assert_match(/#{comments(:kisu).nickname}/, @response.body)
    comment = assigns(:comment)
    assert_not_nil comment
    assert_not_nil comment.page
    assert_not_nil comment.page.id
    assert_match '<form', @response.body
    # TODO(sholder) some assertions about the validity of the XML
  end
end
