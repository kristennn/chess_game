class TblPlayerFeesController < ApplicationController
  layout 'admin'
  def index
    @playerfees = TblPlayerFee.all
    @tblorders = TblOrder.all
    @tblrooms = TblRoom.all
  end
end
