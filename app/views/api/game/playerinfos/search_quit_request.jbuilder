result = []
@records.each do |record|
  result += TblPlayerinfo.where( :userid => record.userid )
end
@players = result
if @player == @group.player
  json.code 0
  json.msg "已查询到退圈记录"
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
      json.quit_time   (player.quit_records.last.created_at + 28800).strftime("%Y/%m/%d  %H:%M:%S")
    end
  end

else
  json.msg "无权限"
end
