class Api::Game::PaysController < ApiController
  def get_notify
    @diamond = params[:reserved1]
    @uid = params[:reserved2]
    @money = params[:amount]
    @tbl_account = TblAccount.find_by(:userid => @uid)

    render :json => {
      :message => "ok"
    }
  end

  def pay_callback
    render :json => {
      :message => "支付成功"
    }
  end
end
