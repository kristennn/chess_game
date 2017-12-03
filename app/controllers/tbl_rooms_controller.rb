class TblRoomsController < ApplicationController
  layout 'admin'
  def index
    @tbl_rooms = TblRoom.page(params[:page]).per(10)

    if params[:time].present?
      @tbl_rooms = @tbl_rooms.where("time >= ?", Date.parse(params[:time]).beginning_of_day)
    end

    if params[:end_time].present?
      @tbl_rooms = @tbl_rooms.where("end_time <= ?", Date.parse(params[:end_time]).end_of_day)
    end
  end
end
