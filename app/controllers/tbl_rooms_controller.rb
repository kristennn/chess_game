class TblRoomsController < ApplicationController
  layout 'admin'
  def index
    @tbl_rooms = TblRoom.page(params[:page]).per(5)
  end
end
