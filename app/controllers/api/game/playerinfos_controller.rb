class Api::Game::PlayerinfosController < ApiController

  before_action :find_group_and_player, only: [:join_group,          #加入圈子
                                               :quit_group,          #退出圈子
                                               :get_group_player,    #查看圈内成员列表
                                               :delete_group_player, #删除圈内成员
                                               :disband_group,       #解散圈子
                                               :search_groupRequest, #查询圈子申请列表
                                               :search_quit_request] #查询退圈记录

############################################ 圈子模块 ##########################################

  def create_group
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @group = GroupMsg.new( :name => params[:name],
                           :discription => params[:discription],
                           :count => params[:count],
                           :pics => params[:pics]
                             )
    @group.player = @player
  end

  def search_group
    @group = GroupMsg.find(params[:groupid])
  end

  def search_grouplist
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @groups = @player.groups
  end

  def join_group
    @record = GroupRecord.new( :group_msg_id => params[:groupid],
                               :userid => params[:userid],
                               :is_join => true
                             )
  end

  def quit_group
    @record = GroupRecord.new( :group_msg_id => params[:groupid],
                               :userid => params[:userid]
                             )
    if @player.is_player_of?(@group) && @record.save
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
  end

  def get_group_player
    @players = @group.players
  end

  def delete_group_player
    @del_player = TblPlayerinfo.find_by_userid!(params[:deluser])
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
    @records = @group.group_records.where(:is_join => true)
    if @group.player == @player
      render :json => {
        :players => @records.map{ |record|
          {
            :userid => record.userid,
            :group_msg_id => record.group_msg_id
          }
        }
      }
    else
      render :json => { :msg => "无权限查看"}
    end
  end

  def search_quit_request
    @records = @group.group_records.where( :is_join => false)
    if @group.player == @player
      render :json => {
        :players => @records.map{ |record|
          {
            :userid => record.userid,
            :group_msg_id => record.group_msg_id
          }
        }
      }
    else
      render :json => { :msg => "无权限查看"}
    end
  end

  private

   def find_group_and_player
     @group = GroupMsg.find(params[:groupid])
     @player = TblPlayerinfo.find_by_userid!(params[:userid])
   end

end
