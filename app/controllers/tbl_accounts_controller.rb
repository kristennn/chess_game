class TblAccountsController < ApplicationController
  layout 'admin'
  def index
    @tbl_accounts = TblAccount.all
    @tbl_playerinfo = TblPlayerinfo.all
  end

end
