class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :check

  def user_login(user)
    session[:user_id] = user.id
  end

  def check
    redirect_to users_path unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
