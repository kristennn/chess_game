if !@player.is_player_of?(@group) && @submit_record.blank?
  @record.save
  json.code 0
  json.msg "已发出申请"
elsif @submit_record.present?
  json.code 1
  json.msg "已发出申请，请等待圈主审查"
elsif @player.is_player_of?(@group)
  json.msg "你已在圈内，无法发出申请"
end
