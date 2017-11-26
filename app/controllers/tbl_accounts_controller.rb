class TblAccountsController < ApplicationController
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

  end

end
