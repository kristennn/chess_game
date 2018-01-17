if !@player.is_player_of?(@group) && @record.save
  json.code 0
  json.msg "已发出申请"
else
  json.msg "未能加入"
end
