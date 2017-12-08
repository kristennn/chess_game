class TblPlayerFeesController < ApplicationController
  layout 'admin'
  def index
    @playerfees = TblPlayerFee.all
  end
end
