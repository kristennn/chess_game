result = []
@records.each do |record|
  result += TblPlayerinfo.where( :userid => record.userid )
end
@players = result
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
      json.viptype     player.account.vip_type
      json.headingurl  player.headimg
      json.score       player.score
      json.diamond     player.diamond
    end
  end
else
  json.msg "无权限"
end
