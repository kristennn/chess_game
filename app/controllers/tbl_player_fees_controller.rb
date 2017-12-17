class TblPlayerFeesController < ApplicationController
  layout 'admin'
  def index
    @playerfees = TblPlayerFee.all
    @tbl_orders = TblOrder.all
    @tbl_room = TblRoom.all
  end
end
