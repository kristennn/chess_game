class TblPlayerFeesController < ApplicationController
  layout 'admin'
  def index
    @playerfees = TblPlayerFee.all
    @tbl_orders = TblOrder.order("complete_time DESC")
    @tbl_room = TblRoom.all
  end
end
