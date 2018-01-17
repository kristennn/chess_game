if @agree == "true" && @request.present? && !@dealer.following?(@player)
  # @request.destroy
  @dealer.follow!(@player)
  @player_relationship.save!
  json.code 0
  json.msg "已同意好友申请"
elsif @dealer.following?(@player)
  @player_relationship.save!
  json.code 0
  json.msg "已同意好友申请"
elsif @request.present?
  # @request.destroy
  json.code 1
  json.msg "已拒绝"
end
