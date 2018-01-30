if @player != @group.player
  if @player.is_player_of?(@group) && @record.save && @time_record.save
    @player.quit!(@group)
    json.code 0
    json.msg "您已退出此圈子"
  else
    json.code 1
    json.msg "您不在该圈子内，无法退出"
  end
else
  json.code 2
  json.msg "您是群主，不可退出"
end
