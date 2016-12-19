class UsersController < ApplicationController
  skip_before_action :check, only: [:index, :login]

  def index

  end

  def login
    user = User.find_by(name: params[:user][:name])
    if user
      if user.password_digest == params[:user][:password]
        user_login(user)
        redirect_to root_path
      else
        redirect_to root_path, notice: '密码错误'
      end
    else
      redirect_to root_path, notice: '账号不存在'
    end
  end

end
