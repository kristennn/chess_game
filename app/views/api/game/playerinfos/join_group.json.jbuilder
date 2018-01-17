if !@player.is_player_of?(@group) && @record.save
  json.code 0
  json.msg "已发出申请"
elsif @player.is_player_of?(@group)
  json.msg "你已在圈内，无法发出申请"
end
