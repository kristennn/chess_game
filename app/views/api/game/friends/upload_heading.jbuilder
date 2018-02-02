if @player.update(:headimg => params[:image])
  json.code 0
  json.msg  "上传成功"
  json.playerMsg do
    json.uid         @player.userid
    json.name        @player.nickname
    json.gold        @player.gold
    json.online      true
    json.sex         @player.sex
    json.viptype     @player.account.vip_type
    json.headingurl  @player.headimg
    json.score       @player.score
    json.diamond     @player.diamond
  end
else
  json.code 1
  json.msg "上传失败"
end
