class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end

end
