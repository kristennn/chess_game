class TblAccountsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  layout 'admin'
  def index
    if current_user && current_user.permission == "salerone"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "salertwo"
      redirect_to saler_overview_path
    elsif current_user && current_user.permission == "salerthree"
      redirect_to saler_overview_path
    end
    @tbl_accounts = TblAccount.all
    @tbl_playerinfo = TblPlayerinfo.all
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end

end
