class Api::Game::FriendsController < ApiController

#------------------------------- 好友模块 ------------------------------------#
  def search_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @followers = @player.followers
    render :json => {
      :code => 0,
      :msg => "已搜索到好友",
      :players => @followers.map{ |follower|
        {
          :uid => follower.userid
          }
      }
    }
  end

  def destroy_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @friend = TblPlayerinfo.find_by_userid!(params[:toid])
    @player_relationship = PlayerRelationship.find_by_follower_id!(params[:toid])
    if @player.following?(@friend)
      @player_relationship.destroy
      @player.unfollow!(@friend)
      render :json => {
        :code => 0,
        :msg => "已删除，你们已不再是好友"
      }
    else
      render :json => { :msg => "你们不是好友无法删除"}
    end
  end

  def add_player #通过id加好友，好友关系是双向的
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @player1 = TblPlayerinfo.find_by_userid!(params[:toid])
    @friend_request = FriendRequest.new( :userid => params[:userid],
                                         :friend_id => params[:toid]
                                       )
    if !@player.following?(@player1)
       @friend_request.save!
       render :json => {
         :code => 0,
         :msg => "成功发出好友申请"
       }
     elsif @player.following?(@player1)
       render :json => { :msg => "你们已是好友，无法重复添加"}
     elsif
       render :json => { :msg => "此用户不存在！"}
    end

  end

  def search_request #与add_player方法配合使用
    @requests = FriendRequest.where(:friend_id => params[:userid])
    result = []
    @requests.each do |request|
      a = TblPlayerinfo.where(:userid => request.userid)
      result += a
    end
    @players = result
  end

  def deal_request #与add_player方法配合使用
    @dealer = TblPlayerinfo.find_by_userid!(params[:userid])
    @player = TblPlayerinfo.find_by_userid!(params[:toid])
    @request = FriendRequest.where("friend_requests.userid =? AND friend_requests.friend_id =?", params[:toid], params[:userid]).first
    @player_relationship = PlayerRelationship.new( :follower_id => params[:toid],
                                                   :followed_id => params[:userid]
                                                 )
    @agree = params[:agree] #params里出来的是字符串
    if @agree == "true" && @request.present?
       @request.destroy
       @dealer.follow!(@player)
       @player_relationship.save!
      render :json => {
        :msg => "已同意好友申请",
        :code => 0
      }
    elsif @request.present?
      @request.destroy
      render :json => {
        :msg => "已拒绝好友申请",
        :code => 1
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

end
