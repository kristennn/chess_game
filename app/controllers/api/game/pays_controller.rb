class Api::Game::PaysController < ApiController
  def get_notify
    @diamond = params[:reserved1]
    @uid = params[:reserved2]
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
