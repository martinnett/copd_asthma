class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      user_login user
      skip_authorization_check
      redirect_to patients_path
    else
      flash.now[:danger] = '用户名或者密码错误'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
