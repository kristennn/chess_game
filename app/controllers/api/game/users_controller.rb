class Api::Game::UsersController < ApiController
  def bind_user
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    if @tbl_account.saler.present?
      render :json => { :message => "绑定失败，该用户已绑定"}
    else
      a = params[:invitation_code]
      @tbl_account.update(:saler => a )
      render :json => {
        :message => "绑定成功",
        :data => @tbl_account.saler
      }
    end
  end

  def get_bind
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    render :json => {
      :message => "ok",
      :data => @tbl_account.saler
    }
  end

  def share_activity
    @tbl_playerinfo = TblPlayerinfo.find_by_userid!(params[:uid])
    b = @tbl_playerinfo.diamond + 10
    @tbl_playerinfo.update(:diamond => b )
    render :json => {
      :message => "ok",
      :data => @tbl_playerinfo.diamond
    }
  end

  

end
