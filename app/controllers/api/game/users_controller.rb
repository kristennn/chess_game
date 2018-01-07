class Api::Game::UsersController < ApiController
  def update
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    if @tbl_account.saler.present?
      render :json => { :message => "绑定失败，该用户已绑定"}
    else
      a = params[:invitation_code]
      @tbl_account.update(:saler => a )
      render :json => {
        :message => "绑定成功"
      }
    end
  end

  def show
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    render :json => {
      :message => "ok"
    }
  end

end
