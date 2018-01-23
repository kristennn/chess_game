if !@player.following?(@player1) && @friend_request.blank?
   @friend_request.save!
   json.code 0
   json.msg "成功发出好友申请"
 elsif @player.following?(@player1)
   json.code 1
   json.msg "你们已是好友，无法重复添加"
 elsif !@player.following?(@player1) && @friend_request.present?
   json.code 2
   json.msg "已发出申请"
 elsif
   json.msg "此用户不存在"
end
