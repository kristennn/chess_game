class Api::Game::CallboardsController < ApiController
  def get_news
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    @callboard = Callboard.last
    if @tbl_account.present?
      render :json => {
        :message => "ok",
        :data => @callboard.post
      }
    else
      render :json => {
        :message => "您没有权限查看公告"
      }
    end
  end

end
