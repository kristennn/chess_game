class Api::Game::UsersController < ApiController
  def bind_user
    @tbl_account = TblAccount.find_by_userid(params[:uid])
    if @tbl_account.blank?
      render :json => {
         :code => 1,
         :message => "用户不存在"
       }
    elsif @tbl_account.saler.present?
      render :json => {
        :code => 2,
        :message => "绑定失败，该用户已绑定"
      }
    elsif @tbl_account.saler.blank?
      @tbl_account.update(:saler => params[:invitation_code])
      render :json => {
        :code => 0,
        :msg => "绑定成功",
        :time => params[:time],
        :apiurl => "/api/game/users/setUserBind",
        :ApiHash => "5aee5c0f5bb8aecbe781e5f4ec3f827e",
        :data => @tbl_account.saler
      }
    end
  end

  def get_bind
    @tbl_account = TblAccount.find_by_userid(params[:uid])
    if @tbl_account.present? && @tbl_account.saler.present?
      render :json => {
        :code => 0,
        :msg => "ok",
        :time => params[:time],
        :apiurl => "/api/game/users/getUserBindInfo",
        :ApiHash => "4b50512c9c732419a0d992ab9cd202bc",
        :data => @tbl_account.saler
      }
    elsif @tbl_account.blank?
       render :json => {
         :code => 1,
         :msg  => "玩家不存在"
       }
    elsif @tbl_account.present? && @tbl_account.saler.blank?
       render :json => {
         :code => 2,
         :msg => "您还未绑定代理商"
       }
    end
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
