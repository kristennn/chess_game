class TblRoomsController < ApplicationController
  def index
    @tbl_rooms = TblRoom.all
  end
end
