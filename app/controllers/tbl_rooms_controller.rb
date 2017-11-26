class TblRoomsController < ApplicationController
  layout 'admin'
  def index
    @tbl_rooms = TblRoom.page(params[:page]).per(10)
  end
end
