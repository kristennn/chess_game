class UsersController < ApplicationController
  layout "session"
  def new
    @user = User.new
  end

  def index
    if current_user.permission == "manager"
      @users = User.all
    elsif current_user.permission == "salerone"
      @users = User.where(:permission => "salerone") + User.where(:permission => "salertwo") + User.where(:permission => "salerthree")
    elsif current_user.permission == "salertwo"
      @users = User.where(:permission => "salertwo") + User.where(:permission => "salerthree")
    elsif current_user.permission == "salertwo"
      @users = User.where(:permission => "salerthree")
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash[:notice] = "注册成功"
    else
      render 'new'
    end
  end

  def saler_info
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
