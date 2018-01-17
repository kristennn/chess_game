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
    json.uid player.useriid
    json.name player.nickname
  end
end
