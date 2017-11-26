class TblSystemsController < ApplicationController
  layout 'admin'
  def index
    @tblaccounts = TblAccount.page(params[:page]).per(10)
    @tblorders = TblOrder.page(params[:page]).per(10)
    @tblplayers = TblPlayerinfo.page(params[:page]).per(10)
    @online_count = 0
    @active_count = 0
    @signin_count = 0
    @diamond_count = 0
    @money_count = 0
  end
end
