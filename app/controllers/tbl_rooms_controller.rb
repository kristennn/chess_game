class TblRoomsController < ApplicationController
  before_action :logged_in_user
  layout 'admin'

  def index
    @tbl_rooms = TblRoom.all
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:alert] = "请先登录"
      redirect_to login_path
    end
  end
end
