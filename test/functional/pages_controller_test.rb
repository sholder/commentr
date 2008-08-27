require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  def setup
    @request.session[:user_id] = users(:sholder).id
  end
  
  def test_not_logged_in
    @request.session[:user_id] = nil
    get :index
    assert_redirected_to login_url
  end
  
  def test_logged_in_non_admin
    @request.session[:user_id] = users(:clay).id
    get :index
    assert_redirected_to login_url
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_page
    assert_difference('Page.count') do
      post :create, {:site_id => sites(:nentir_vale), :page => {:name => 'new page'}}
    end

    assert_redirected_to page_path(assigns(:page))
  end

  def test_should_show_page
    get :show, :id => pages(:nv_session_1).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pages(:nv_session_1).id
    assert_response :success
  end

  def test_should_update_page
    put :update, :id => pages(:nv_session_1).id, :page => { }
    assert_redirected_to page_path(assigns(:page))
  end

  def test_should_destroy_page
    assert_difference('Page.count', -1) do
      delete :destroy, :id => pages(:nv_session_1).id
    end

    assert_redirected_to pages_path
  end
  
  def test_page_routing
    page_id = pages(:nv_session_1).id
    assert_generates "/pages/#{page_id}/comments", 
                      :controller => 'comments', :action => 'index', 
                      :page_id => page_id
    assert_recognizes({'controller' => 'comments', 'action' => 'index', 'page_id' => page_id.to_s}, 
                      "/pages/#{page_id}/comments")
  end
end
