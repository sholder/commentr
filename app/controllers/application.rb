# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '2b0c016dc10bfa941e05cc1db2a929b8'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  protected
  
  def logged_in?
    return !session[:user_id].nil?
  end
  
  def admin?
    return false unless logged_in?
    @user ||= User.find(session[:user_id])
    @user.is_admin
  end
  
  def admin_only
    redirect_to login_url unless admin?
  end
  
end
