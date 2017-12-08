class TblAccountsController < ApplicationController
  before_action :logged_in_user
  layout 'admin'
  #include TblAccountHelper

  def index
    @tbl_playerinfo = TblPlayerinfo.order("userid DESC").page(params[:page]).per(10)
    @q = TblAccount.order("userid DESC").ransack(params[:q])
    @tbl_accounts = @q.result.order("userid DESC").page(params[:page]).per(10)

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

    if current_user && current_user.permission == "一级代理"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "二级代理"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "三级代理"
      redirect_to saler_overview_path
    end

  end


end
