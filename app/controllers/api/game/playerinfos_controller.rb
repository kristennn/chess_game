class Api::Game::PlayerinfosController < ApiController

  def search_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :players => @player.nickname,
      :message => "已搜索到好友"
    }
  end

  def destroy_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @player.destroy
    render :json => {
      :message => "删除好友成功"
    }
  end

  def add_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "添加好友成功"
    }
  end

  def search_request
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :players => @player.nickname,
      :message => "已搜索到请求列表"
    }
  end

  def deal_request
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @agree = params[:agree]
    if @agree
      render :json => {
        :message => "已同意好友申请"
      }
    else
      render :json => {
        :message => "已拒绝好友申请"
      }
    end
  end

  def add_target_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @target = TblPlayerinfo.find_by_userid!(params[:targetPlayers])
    render :json => {
      :message => "配对成功，已添加该好友"
    }
  end

  def get_phone_list
    render :json => {
      :message => "已搜索到通讯录好友"
    }
  end

end
