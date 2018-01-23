class Api::Game::FriendsController < ApiController

#------------------------------- 好友模块 ------------------------------------#
  def search_player
    @player = TblPlayerinfo.where( :userid => params[:userid])
  end

  def destroy_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @friend = TblPlayerinfo.find_by_userid!(params[:toid])
    @player_relationship = PlayerRelationship.find_by_follower_id!(params[:toid])
  end

  def add_player #通过id加好友，好友关系是双向的
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @player1 = TblPlayerinfo.find_by_userid!(params[:toid])
    @friend_request = FriendRequest.new( :userid => params[:userid],
                                           :friend_id => params[:toid]
                                         )
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
  end

  def add_target_player #配对加好友
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
  end

  def get_phone_list #通讯录搜索好友
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
  end

  def search_playerinfo
    @player = TblPlayerinfo.where( :userid => params[:userid])
  end

end
