class TblAccountsController < ApplicationController
  layout 'admin'
  def index
    @tbl_accounts = TblAccount.page(params[:page]).per(10)
    @tbl_playerinfo = TblPlayerinfo.page(params[:page]).per(10)
  end

end
