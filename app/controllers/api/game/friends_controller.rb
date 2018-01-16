class Api::Game::FriendsController < ApiController

#------------------------------- 好友模块 ------------------------------------#
  def search_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @followers = @player.following
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

  def add_target_player #配对加好友
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    targets = params[:targetPlayers]
    targets = targets[1..-2]
    targets = targets.split(",")
    targets.each do |target|
      gamer = TblPlayerinfo.find_by_userid!(target)
      if !@player.following?(gamer)
        @player.follow!(gamer)
      end
    end
    render :json => {
      :code => 0,
      :msg => "恭喜你，配对成功！"
    }
  end

  def get_phone_list #通讯录搜索好友
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    phone_numbers = params[:phoneNumber]
    phone_numbers = phone_numbers[1..-2]
    phone_numbers = phone_numbers.split(",")
    result = []
    phone_numbers.each do |phone|
      gamer = TblPlayerinfo.where( :phonenumber => phone)
      result += gamer
    end
    @players = result
    render :json => {
      :code => 0,
      :msg => "已搜索到通讯录好友",
      :players => @players.map{ |player|
        {
          :uid => player.userid,
          :name => player.nickname
        }
      }
    }
  end

end
