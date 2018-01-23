if @group.present?
  @group = @group.first
    json.code 0
    json.msg "搜索结果如下"
    json.group do
      json.id           @group.id
      json.discription  @group.discription
      json.name         @group.name
      json.count        @group.count
      json.pics         @group.pics
      # if @player == @group.player
      #   json.role "owner"
      # elsif @player != @group.player && @player.is_player_of?(@group)
      #   json.role "joined"
      # elsif @player != @group.player
      #   json.role "unjoined"
      # end
    end
else
  json.code 1
  json.msg "圈子不存在"
end
