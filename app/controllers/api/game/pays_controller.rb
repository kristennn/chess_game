class Api::Game::PaysController < ApiController
  def get_notify
    @memberid = params[:memberid]
    @orderid = params[:orderid]
    @amount = params[:amount]
    @datetime = params[:datetime]
    # render :json => {
    #   :message => "ok"
    #   # :memberid   => params[:memberid],
    #   # :orderid    => params[:orderid],
    #   # :amount     => params[:amount],
    #   # :datetime   => params[:datetime],
    #   # :returncode => params[:returncode]
    # }
  end

  def pay_callback
    render :json => {
      :message => "支付成功"
    }
  end
end
