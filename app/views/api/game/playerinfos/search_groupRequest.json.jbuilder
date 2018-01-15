if @player == @group.player
  json.code 0
  json.msg "已查询到圈内申请记录"
  json.players do
    json.array! @players do |player|
      json.uid         player.userid
      json.name        player.nickname
      json.gold        player.gold
      json.online      true
      json.sex         player.sex
      json.viptype     player.honor
      json.headingurl  player.headimg
      json.score       player.diamond
    end
  end

else
  json.msg "您不是群主，无法查看申请记录"
end
