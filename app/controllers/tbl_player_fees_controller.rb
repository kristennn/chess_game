class TblPlayerFeesController < ApplicationController
  layout 'admin'
  def index
    @playerfees = TblPlayerFee.page(params[:page]).per(5)
    @tbl_orders = TblOrder.order("complete_time DESC").page(params[:page]).per(5)
    @tbl_room = TblRoom.all
  end
end
