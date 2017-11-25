class TblSystemsController < ApplicationController
  layout 'admin'
  def index
    @tblaccounts = TblAccount.all
    @online_count = 0
  end
end
