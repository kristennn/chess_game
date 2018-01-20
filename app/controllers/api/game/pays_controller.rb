class Api::Game::PaysController < ApiController
  def get_notify
    @diamond = params[:reserved1]
    @uid = params[:reserved2]

    require "net/http"
    url = URI.parse('http://47.100.117.210:8691/update_data?name=diamond&num=' +@diamond+ '&uid=' +@uid)
    res = Net::HTTP.start(url.host, url.port)


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
