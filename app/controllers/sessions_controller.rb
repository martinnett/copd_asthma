class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      user_login user
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
