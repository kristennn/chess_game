class Api::Game::PaysController < ApiController
  def get_notify
    @diamond = params[:reserved1]
    @uid = params[:reserved2]
    @money = params[:amount]
    @tbl_account = TblAccount.find_by(:userid => @uid)

    require "net/http"
    url = URI.parse('http://47.100.117.210:8691/update_data')
    params = {:name = @diamond, :num = @amount, :uid = @uid}
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port){|http|
      http.request(req)
    }
    puts res.body

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
