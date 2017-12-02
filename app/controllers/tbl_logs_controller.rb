class TblLogsController < ApplicationController
  def index
    @playerfees = TblPlayerFee.all
  end
end
