class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:notice] = "登录成功"
      redirect_to root_path
    else
      flash[:alert] = "用户名或密码错误"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
    flash[:alert] = "退出登录"
  end
end
