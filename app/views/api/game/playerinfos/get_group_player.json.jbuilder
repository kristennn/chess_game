if @player.is_player_of?(@group)
  json.code  0
  json.msg  "已查询到圈内成员"
  json.players do
    json.array! @players do |player|
      json.uid  player.userid
      json.name  player.nickname
      json.gold  player.gold
      json.online  true
      json.sex  player.sex
      json.viptype  player.honor
      json.headingurl  player.headimg
      json.score  player.diamond
    end
  end
else
  json.msg "您不是本圈子成员，无法查看圈内信息"
end
