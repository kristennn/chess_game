if @player.following?(@friend)
  @player_relationship.destroy
  @player.unfollow!(@friend)
  if @friend.following?(@player)
     @friend.unfollow!(@player)
  end
  json.code 0
  json.msg "已删除，你们不再是好友"
else
  json.msg "你们不是好友无法删除"
end
