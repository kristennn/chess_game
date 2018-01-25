if @player.present? && @group.present?
  @group = @group.first
  @players = @group.players
  if @player.is_player_of?(@group)
    json.code  0
    json.msg  "已查询到圈内成员"
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
    json.msg "您不是本圈子成员，无法查看圈内信息"
  end
elsif @group.blank?
  json.code 1
  json.msg "圈子不存在"
elsif @player.blank?
  json.code 2
  json.msg "玩家不存在"
end
