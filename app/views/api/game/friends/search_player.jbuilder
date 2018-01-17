result = []
@following.each do |f|
  result += TblPlayerinfo.where( :userid => f.userid)
end
@players = result

json.code 0
json.msg "搜索结果如下"
json.players do
  json.array! @players do |player|
    json.uid         player.userid
    json.name        player.nickname
    json.gold        player.gold
    json.online      true
    json.sex         player.sex
    json.viptype     player.account.vip_type
    json.headingurl  player.headimg
    json.score       player.score
    json.diamond     player.diamond
  end
end
