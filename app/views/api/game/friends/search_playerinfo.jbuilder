if @player.present?
  @gamer = @player.first
  json.code 0
  json.msg "已找到该玩家"
  json.playerMsg do
    json.uid         @gamer.userid
    json.name        @gamer.nickname
    json.gold        @gamer.gold
    json.online      render_online_status(@gamer)
    json.sex         @gamer.sex
    json.viptype     @gamer.account.vip_type
    json.headimgurl  @gamer.headimg
    json.score       @gamer.score
    json.diamond     @gamer.diamond
    json.location    render_location(@gamer)
  end
else
  json.code 1
  json.msg "玩家不存在"
end
