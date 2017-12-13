class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  layout "session"

  def new
    @user = User.new
  end

  def index
    if current_user.permission == "manager"
      @users = User.all.order("id DESC").page(params[:page]).per(15)
    elsif current_user.permission == "一级代理"
      @users = User.where(:permission => "一级代理") + User.where(:permission => "二级代理").page(params[:page]).per(10) + User.where(:permission => "三级代理")
    elsif current_user.permission == "二级代理"
      @users = User.where(:permission => "二级代理") + User.where(:permission => "三级代理").page(params[:page]).per(10)
    elsif current_user.permission == "三级代理"
      @users = User.where(:permission => "三级代理")
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if current_user.permission == "manager"
        redirect_to users_path
      else
        redirect_to saler_info_path
      end
      flash[:notice] = "恭喜您，#{@user.name}创建成功"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新成功"
      redirect_to saler_overview_path
    else
      render :edit
    end
  end

  def saler_info
    @usersone = User.where(:salerid => current_user.id)
    if current_user.permission == "一级代理"
      result = []
      @usersone.each do |i|
        u = User.where(:salerid => i.id)
        result += u
      end
      @userstwo = result
    else
      @userstwo = User.where(:salerid => current_user.id)
    end
  end

  def player_info
    @users = TblAccount.where(:saler => current_user.id)
  end

  def add_diamond_to_user
    @user = User.find(params[:id])
    @user.diamond.create
    @user.save
    redirect_to back
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :permission, :salerid, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
