class TblAccountsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  layout 'admin'
  def index
    @tbl_playerinfo = TblPlayerinfo.page(params[:page]).per(10)
    @q = TblAccount.ransack(params[:q])
    @tbl_accounts = @q.result.page(params[:page]).per(10)

    if params[:userid].present?
      @tbl_accounts = @tbl_accounts.where( :userid => params[:userid].split(",") )
    end

    if params[:create_time].present?
      @tbl_accounts = @tbl_accounts.where( "create_time <= ?", Date.parse(params[:create_time]).end_of_day)
      @tbl_accounts = @tbl_accounts.where( "create_time >= ?", Date.parse(params[:create_time]).beginning_of_day)
    end

    if params[:vip_invalid_time].present?
      @tbl_accounts = @tbl_accounts.where( "vip_invalid_time <= ?", Date.parse(params[:vip_invalid_time]).end_of_day)
      @tbl_accounts = @tbl_accounts.where( "vip_invalid_time >= ?", Date.parse(params[:vip_invalid_time]).beginning_of_day)
    end

    if params[:login_time].present?
      @tbl_accounts = @tbl_accounts.where( "login_time <= ?", Date.parse(params[:login_time]).end_of_day)
      @tbl_accounts = @tbl_accounts.where( "login_time >= ?", Date.parse(params[:login_time]).beginning_of_day)
    end

    if params[:logout_time].present?
      @tbl_accounts = @tbl_accounts.where( "logout_time <= ?", Date.parse(params[:logout_time]).end_of_day)
      @tbl_accounts = @tbl_accounts.where( "logout_time >= ?", Date.parse(params[:logout_time]).beginning_of_day)
    end

    if current_user && current_user.permission == "salerone"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "salertwo"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "salerthree"
      redirect_to saler_overview_path
    end
    @tbl_accounts = TblAccount.page(params[:page]).per(10)
    @tbl_playerinfo = TblPlayerinfo.page(params[:page]).per(10)
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end

end
