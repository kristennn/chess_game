class TblRoomsController < ApplicationController
  before_action :logged_in_user
  layout 'admin'

  def index
    @tbl_rooms = TblRoom.order("table_id DESC").page(params[:page]).per(10)
    @tbl_playerinfos = TblPlayerinfo.all

    if params[:time].present?
      @tbl_rooms = @tbl_rooms.where("time >= ?", Date.parse(params[:time]).beginning_of_day)
    end

    if params[:end_time].present?
      @tbl_rooms = @tbl_rooms.where("end_time <= ?", Date.parse(params[:end_time]).end_of_day)
    end
  end

end
