class Api::Game::PaysController < ApiController
  def get_notify
    @diamond = params[:reserved1]
    @uid = params[:reserved2]
    @money = params[:amount]
    @order_id = params[:orderid]
    @datetime = params[:datetime]

    @order = TblOrder.create( :userid   => params[:reserved2],
                              :money    => params[:amount],
                              :order_id => params[:orderid],
                              :pay_time => params[:datetime],
                            )
    @order.save!
    require 'open-uri'

    uri = 'http://47.100.117.210:8691/update_data?name=diamond&num='+@diamond+'&uid='+@uid
      html_response = nil
      open(uri) do |http|
        html_response = http.read
      end
      puts html_response

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
