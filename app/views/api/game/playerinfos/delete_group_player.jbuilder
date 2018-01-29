delusers = params[:deluser]
delusers = delusers[1..-2].split(",")
delusers.each do |deluser|
  user = TblPlayerinfo.find_by_userid(deluser)
  if user.is_player_of?(@group) && @group.player == @player
    user.quit!(@group)
    json.code 0
    json.msg "已移出圈子"
  elsif user.is_player_of?(@group) && @group.player != @player
    json.code 1
    json.msg "无权限"
  elsif !user.is_player_of?(@group)
    json.code 2
    json.msg "该成员不是圈内成员"
  end
end
