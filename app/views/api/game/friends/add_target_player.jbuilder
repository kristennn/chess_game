targets = params[:targetPlayers]
targets = targets[1..-2]
targets = targets.split(",")
targets.each do |target|
  gamer = TblPlayerinfo.find_by_userid!(target)
  if !@player.following?(gamer)
    @player.follow!(gamer)
  end
end

json.code 0
json.msg "恭喜你，配对成功"
