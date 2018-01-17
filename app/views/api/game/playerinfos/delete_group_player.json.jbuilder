if @del_player.is_player_of?(@group) && @group.player == @player
   @del_player.quit!(@group)
   json.code 0
   json.msg "已将#{@del_player.nickname}移出本圈"
else
   json.msg "无权限或该成员不是圈内成员"
end
