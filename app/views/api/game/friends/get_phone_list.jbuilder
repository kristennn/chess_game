phone_numbers = params[:phoneNumber]
phone_numbers = phone_numbers[1..-2]
phone_numbers = phone_numbers.split(",")
result = []
phone_numbers.each do |phone|
  gamer = TblPlayerinfo.where( :phonenumber => phone)
  result += gamer
end
@players = result

json.code 0
json.msg "已搜索到通讯录好友"
json.playerMsg do
  json.array! @players do |player|
    json.uid         player.userid
    json.name        player.nickname
    json.gold        player.gold
    json.online      true
    json.sex         player.sex
    json.viptype     player.account.vip_type
    json.headimgurl  player.headimg
    json.score       player.score
    json.diamond     player.diamond
    json.location    render_location(player)
  end
end
