if @group.present?
  @group = @group.first
  if @user == @group.player
    json.code 0
    json.msg "搜索结果如下"
    json.group do
      json.id           @group.id
      json.discription  @group.discription
      json.name         @group.name
      json.count        @group.count
      json.pics         @group.pics
      json.role         "owner"
    end
  elsif @user != @group.player && @user.is_player_of?(@group)
    json.code 1
    json.msg "搜索结果如下"
    json.group do
      json.id           @group.id
      json.discription  @group.discription
      json.name         @group.name
      json.count        @group.count
      json.pics         @group.pics
      json.role         "joined"
    end
  elsif @user != @group.player
    json.code 2
    json.msg "搜索结果如下"
    json.group do
      json.id           @group.id
      json.discription  @group.discription
      json.name         @group.name
      json.count        @group.count
      json.pics         @group.pics
      json.role         "unjoined"
    end
  end
else
  json.code 1
  json.msg "圈子不存在"
end
