upload_ip = "120.78.223.115:8011"

if @player.update(:headimgxf => params[:image])
  @player.update( :headimg => upload_ip + @player.headimgxf.to_s )
  json.code 0
  json.msg  "上传成功"
  json.playerMsg do
    json.uid         @player.userid
    json.name        @player.nickname
    json.gold        @player.gold
    json.online      true
    json.sex         @player.sex
    json.viptype     @player.account.vip_type
    json.headimgurl  @player.headimg
    json.score       @player.score
    json.diamond     @player.diamond
    json.location    render_location(@player)
  end
else
  json.code 1
  json.msg "上传失败"
end
