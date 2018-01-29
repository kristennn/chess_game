class Api::Game::PlayerinfosController < ApiController

  before_action :find_group_and_player, only: [:join_group,          #加入圈子
                                               :quit_group,          #退出圈子
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
    @group = GroupMsg.where( :id => params[:groupid])
    @user = TblPlayerinfo.find_by_userid(params[:userid])
  end

  def search_grouplist
    @player = TblPlayerinfo.find_by_userid(params[:userid])
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
    @time_record = QuitRecord.new( :userid => params[:userid])
  end

  def get_groupinfo
    @player = TblPlayerinfo.find_by_userid(params[:userid])
    @group = GroupMsg.where( :id => params[:groupid])
  end

  def get_group_player
    @group = GroupMsg.where( :id => params[:groupid])
    @player = TblPlayerinfo.find_by_userid(params[:userid])
  end

  def delete_group_player
    @group = GroupMsg.find(params[:groupid])
    @player = TblPlayerinfo.find_by_userid(params[:userid])
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
  end

  def search_quit_request
    @records = @group.group_records.where( :is_join => false)
  end

  def deal_group_request
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @gamer = TblPlayerinfo.find_by_userid!(params[:toid])
    @group = GroupMsg.find(params[:groupid])
    @record = GroupRecord.where("group_records.userid =? AND group_records.group_msg_id =? AND group_records.is_join =?", params[:toid], params[:groupid], true).first
    @agree = params[:agree]
  end

  def search_all_groups
    @user = TblPlayerinfo.find_by_userid(params[:userid])
    @groups = GroupMsg.all
  end

  private

   def find_group_and_player
     @group = GroupMsg.find(params[:groupid])
     @player = TblPlayerinfo.find_by_userid!(params[:userid])
   end

end
