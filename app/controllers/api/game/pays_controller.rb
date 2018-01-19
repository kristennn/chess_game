class Api::Game::PaysController < ApiController
  def get_notify
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
