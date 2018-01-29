if @group.present? && @user.present?
  @group = @group.first
    json.code 0
    json.msg "搜索结果如下"
    json.group do
      json.id           @group.id
      json.discription  @group.discription
      json.name         @group.name
      json.count        @group.count
      json.pics         @group.pics
      json.numpeople    @group.players.count
      if @user == @group.player
        json.role "owner"
      elsif @user != @group.player && @user.is_player_of?(@group)
        json.role "joined"
      elsif @user != @group.player
        json.role "unjoined"
      end
    end
elsif @group.blank?
  json.code 1
  json.msg "圈子不存在"
elsif @user.blank?
  json.code 2
  json.msg "玩家不存在"
end
