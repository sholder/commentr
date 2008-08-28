# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def logged_in?
    return !session[:user_id].nil?
  end
  
  def admin?
    return false unless logged_in?
    @user ||= User.find(session[:user_id])
    @user.is_admin
  end

end
