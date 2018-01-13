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

  def create_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :player => @player.nickname,
      :message => "成功创建圈子"
    }
  end

  def search_group
    render :json => {
      :message => "成功搜索到圈子",
      :groupmsg => "圈子id为1"
    }
  end

  def search_grouplist
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "已查询到圈子列表"
    }
  end

  def join_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "已加入到本圈子"
    }
  end

  def get_groupinfo
    render :json => {
      :message => "已找到您要查询的圈子",
      :group => "圈子id为3"
    }
  end

  def get_group_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "本圈子成员有：#{@player.nickname}"
    }
  end

  def delete_group_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "已删除圈内成员：#{@player.nickname}"
    }
  end

  def quit_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "#{@player.nickname}已退出本圈子"
    }
  end

  def disband_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "#{@player.nickname}已解散本圈子"
    }
  end

  def search_groupRequest
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "#{@player.nickname}已查询到圈子申请列表"
    }
  end

  def search_quit_request
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    render :json => {
      :message => "#{@player.nickname}已查询到圈子的退圈记录"
    }
  end

end
