@request = FriendRequest.where("friend_requests.userid =? AND friend_requests.friend_id =?", params[:userid], params[:toid])
if @player.present? && @player1.present?
  if !@player.following?(@player1) && @request.blank?
     @friend_request.save!
     json.code 0
     json.msg "成功发出好友申请"
   elsif @player.following?(@player1)
     json.code 1
     json.msg "你们已是好友，无法重复添加"
   elsif !@player.following?(@player1) && @request.present?
     json.code 2
     json.msg "已发出申请"
  end
else
  json.code 3
  json.msg "用户不存在"
end
