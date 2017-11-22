class TblRoomsController < ApplicationController
  layout 'admin'
  def index
    @tbl_rooms = TblRoom.all
  end
end
