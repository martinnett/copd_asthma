# 登录相关帮助方法
module SessionsHelper
  def user_login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def user_logined?
    !current_user.nil?
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def current_user
    @current_user ||= login_from_session
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    session.delete(:last_active_at)
  end
end
