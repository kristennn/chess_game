class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, only: [:show, :edit, :update, :add_diamond]

  layout "session"

  def new
    @user = User.new
  end

  def index
    if current_user.permission == "manager"
      @users = User.all.order("id DESC").page(params[:page]).per(15)
    elsif current_user.permission == "县级代理"
      @users = User.where(:permission => "县级代理") + User.where(:permission => "城市合伙人").page(params[:page]).per(10) + User.where(:permission => "普通代理")
    elsif current_user.permission == "城市合伙人"
      @users = User.where(:permission => "城市合伙人") + User.where(:permission => "普通代理").page(params[:page]).per(10)
    elsif current_user.permission == "普通代理"
      @users = User.where(:permission => "普通代理")
    end
  end

  def show
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
  end

  def update
    if @user.update(user_params)
      if current_user.permission == "manager"
        flash[:notice] = "更新成功"
        redirect_to tbl_accounts_path
      else
        flash[:notice] = "更新成功"
        redirect_to saler_overview_path
      end

    else
      render :edit
    end
  end

  def saler_info
    @usersone = User.where(:salerid => current_user.id)
    if current_user.permission == "县级代理"
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
    @tbl_playerinfo = TblPlayerinfo.all
  end

  def add_diamond_info
    @playerinfo = TblPlayerinfo.find(params[:id])
    a= params[:tbl_playerinfo].values.first.to_i
    b= @playerinfo.diamond + a
    c= current_user.diamond - a

    if @playerinfo.update(:diamond => b)
      current_user.update(:diamond => c)
      flash[:notice] = "为玩家#{@playerinfo.nickname}充值成功"
      redirect_to player_info_path
    end
  end

  def add_diamond
    $a = params[:user].values.first.to_i
    b = $a + @user.diamond
    if current_user.permission == "manager"
      @user.update(:diamond => b)
      flash[:notice] = "钻石充值成功"
      redirect_to users_path
    else
      c = current_user.diamond - $a
      @user.update(:diamond => b )
      current_user.update(:diamond => c)
      flash[:notice] = "转账成功"
      redirect_to saler_info_path
    end
  end

  def manager_info
    render layout: 'manager_sidebar'
  end

  def hongbao
    render layout: 'manager_sidebar'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :permission, :salerid, :password, :password_confirmation, :diamond, :count, :rate)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
