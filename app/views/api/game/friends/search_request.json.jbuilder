json.msg "共搜索到#{@players.count}个请求"
json.code 0
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
