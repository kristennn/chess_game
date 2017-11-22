class TblAccountsController < ApplicationController
  layout 'admin'
  def index
    @tbl_accounts = TblAccount.all
  end
end
