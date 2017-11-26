class TblAccountsController < ApplicationController
  layout 'admin'
  def index
    @tbl_playerinfo = TblPlayerinfo.page(params[:page]).per(10)
    @q = TblAccount.ransack(params[:q])
    @tbl_accounts = @q.result.page(params[:page]).per(10)

    if params[:userid].present?
      @tbl_accounts = @tbl_accounts.where( :userid => params[:userid].split(",") )
    end

  end

end
