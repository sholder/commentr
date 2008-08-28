require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  
  def setup
    @request.session[:user_id] = users(:sholder).id
  end
  
  def test_not_logged_in
    logout
    get :new
    assert_redirected_to login_url
  end
  
  def test_logged_in_non_admin
    logout
    get :new
    assert_redirected_to login_url
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_site
    assert_difference('Site.count') do
      post :create, :site => {:name => 'new site'}
    end

    assert_redirected_to site_path(assigns(:site))
  end

  def test_should_show_site
    get :show, :id => sites(:nentir_vale).id
    assert_response :success
  end

  def test_should_show_site_in_atom_for_non_auth_user
    logout
    get :show, {:id => sites(:nentir_vale).id, :format => 'atom'}
    assert_response :success
    
    # TODO(sholder) asserts about validity of the atom feed
  end

  def test_should_get_edit
    get :edit, :id => sites(:nentir_vale).id
    assert_response :success
  end

  def test_should_update_site
    put :update, :id => sites(:nentir_vale).id, :site => { }
    assert_redirected_to site_path(assigns(:site))
  end

  def test_should_destroy_site
    assert_difference('Site.count', -1) do
      delete :destroy, :id => sites(:nentir_vale).id
    end

    assert_redirected_to sites_path
  end
  
  private 
  
  def logout
    @request.session[:user_id] = nil
  end
end
