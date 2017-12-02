class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新成功"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def saler_info
    @usersone = User.where(:salerid => current_user.id)
    result = []
    @usersone.each do |i|
      u = User.where(:salerid => i.id)
      result += u
    end
    @userstwo = result
  end

  def player_info
    @users = TblAccount.where(:saler => current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :permission, :salerid, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
