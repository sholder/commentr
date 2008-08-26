class MainController < ApplicationController

  def login
    @user = User.new(params[:user])
    logger.info @user
    if(params[:password])
      @u = @user.login(params[:password])
      if @u
        login_user @u
      end
    end
  end

end
