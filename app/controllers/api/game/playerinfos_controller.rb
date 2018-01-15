class Api::Game::PlayerinfosController < ApiController

  before_action :find_group_and_player, only: [:join_group,          #加入圈子
                                               :quit_group,          #退出圈子
                                               :get_group_player,    #查看圈内成员列表
                                               :delete_group_player, #删除圈内成员
                                               :disband_group,       #解散圈子
                                               :search_groupRequest, #查询圈子申请列表
                                               :search_quit_request] #查询退圈记录

  def search_player
    render :json => {
      :players => {
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "http://llalalall.com",
        :score => 1234
      },
      :msg => "已搜索到好友",
      :code => 0
    }
  end

  def destroy_player
    render :json => {
      :msg => "删除好友成功",
      :code => 1
    }
  end

  def add_player
    render :json => {
      :msg => "添加好友成功",
      :code => 2
    }
  end

  def search_request
    render :json => {
      :players => {
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "http://llalalall.com",
        :score => 1234
      },
      :msg => "已搜索到请求列表",
      :code => 3
    }
  end

  def deal_request
    @agree = params[:agree]
    if @agree
      render :json => {
        :msg => "已同意好友申请",
        :code => 4
      }
    else
      render :json => {
        :msg => "已拒绝好友申请",
        :code => 4
      }
    end
  end

  def add_target_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @target = TblPlayerinfo.find_by_userid!(params[:targetPlayers])
    render :json => {
      :msg => "配对成功，已添加该好友",
      :code => 5
    }
  end

  def get_phone_list
    render :json => {
      :players => {
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "http://llalalall.com",
        :score => 1234
      },
      :msg => "已搜索到通讯录好友",
      :code => 6
    }
  end


############################################ 圈子模块 ##########################################

  def create_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @group_msg = GroupMsg.new( :discription => params[:discription],
                               :name => params[:name],
                               :count => params[:count],
                               :pics => params[:pics]
                             )
    @group_msg.player = @player
    if @group_msg.save
      @player.join!(@group_msg)
      render :json => {
        :msg => "成功创建圈子",
        :code => 0,
        :group => {
          :id => @group_msg.id,
          :discription => @group_msg.discription,
          :name => @group_msg.name,
          :count => @group_msg.count,
          :pics => @group_msg.pics
        }
      }
    else
      render :json => {
        :msg => "创建圈子失败",
        :code => 1
      }
    end
  end

  def search_group
    @group_msg = GroupMsg.find(params[:groupid])
    render :json => {
      :code => 0,
      :msg => "成功搜索到圈子",
      :group => {
        :id => @group_msg.id,
        :discription => @group_msg.discription,
        :name => @group_msg.name,
        :count => @group_msg.count,
        :pics => @group_msg.pics
      }
    }
  end

  def search_grouplist
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @groups = @player.groups
  end

  def join_group
    if !@player.is_player_of?(@group)
        @player.join!(@group)
        render :json => {
          :code => 0,
          :msg => "已加入到本圈子"
        }
    else
      render :json => {
        :msg => "您已在此圈子"
      }
    end
  end

  def quit_group
    if @player.is_player_of?(@group)
      @player.quit!(@group)
      render :json => {
        :code => 0,
        :msg => "您已退出此圈子"
      }
    else
      render :json => {
        :message => "你不在该圈子内，无法退出"
      }
    end
  end

  def get_groupinfo
    @group = GroupMsg.find(params[:groupid])
      render :json => {
        :code => 0,
        :msg => "已找到您要查询的圈子",
        :group => {
          :id => @group.id,
          :discription => @group.discription,
          :name => @group.name,
          :count => @group.count,
          :pics => @group.pics
        }
      }
  end

  def get_group_player
    @players = @group.players
  end

  def delete_group_player
    @del_player = TblPlayerinfo.find_by_userid!(params[:deluser])
    if @del_player.is_player_of?(@group) && @group.player == @player
       @del_player.quit!(@group)
       render :json => {
         :code => 0,
         :msg => "已将#{@del_player.nickname}移出本圈"
       }
    else
      render :json => { :msg => "无权限或该成员不是圈内成员"}
    end
  end


  def disband_group
    if @group.player == @player
      @group.destroy
      render :json => {
        :code => 0,
        :msg => "已解散本圈子"
      }
    else
      render :json => { :msg => "无权限"}
    end
  end

  def search_groupRequest
  end

  def search_quit_request
  end

  private

   def find_group_and_player
     @group = GroupMsg.find(params[:groupid])
     @player = TblPlayerinfo.find_by_userid!(params[:userid])
   end

end
