class TblSystemsController < ApplicationController
  layout 'admin'
  def index
    @tblaccounts = TblAccount.all
    @tblorders = TblOrder.all
    @tblplayers = TblPlayerinfo.all
    @online_count = 0
    @active_count = 0
    @signin_count = 0
    @diamond_count = 0
    @money_count = 0
  end
end
