class SessionsController < ApplicationController
  layout "session"
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:notice] = "登录成功"
      redirect_to root_path
    else
      flash[:alert] = "用户名或密码错误"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
    flash[:alert] = "退出登录"
  end
end
