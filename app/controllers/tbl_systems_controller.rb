class TblSystemsController < ApplicationController
  before_action :logged_in_user
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

  private

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end
end
