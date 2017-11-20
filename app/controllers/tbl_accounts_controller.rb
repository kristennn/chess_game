class TblAccountsController < ApplicationController
  def index
    @tbl_accounts = TblAccount.all
  end
end
