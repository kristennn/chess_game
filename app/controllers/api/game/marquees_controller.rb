class Api::Game::MarqueesController < ApiController
  def get_paomatiao
    @tbl_account = TblAccount.find_by_userid!(params[:uid])
    @marquee = Marquee.last
    if @tbl_account.present?
      render :json => {
        :message => "ok",
        :data => @marquee.post
      }
    else
      render :json => {
        :message => "您没有权限查看公告"
      }
    end
  end
end
