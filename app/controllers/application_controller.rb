class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => exception.message
  end

end
