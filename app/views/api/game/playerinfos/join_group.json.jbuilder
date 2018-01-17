if !@player.is_player_of?(@group) && @record.save
  @player.join!(@group)
  json.code 0
  json.msg "已加入到本圈子"
else
  json.msg "未能加入"
end
