class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:danger] = '保存成功'
      redirect_to root_path
    else
      flash.now[:danger] = '保存失败'
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
