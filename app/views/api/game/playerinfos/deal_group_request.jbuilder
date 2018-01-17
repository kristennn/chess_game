if @player == @group.player && @agree == "true" && @record.present?
  @record.destroy
  @gamer.join!(@group)
  json.code 0
  json.msg "同意#{@gamer.nickname}加入你的圈子"
elsif @player == @group.player && @agree == "false" && @record.present?
  @record.destroy
  json.code 1
  json.msg "拒绝#{@gamer.nickname}加入你的圈子"
elsif @player != @group.player
  json.msg "无权限"
elsif @record.blank?
  json.msg "无此申请"
end
