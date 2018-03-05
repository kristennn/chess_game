if @group.save
  @player.join!(@group)
  json.msg "恭喜你，成功创建圈子"
  json.code 0
  json.group do
    json.id           @group.id
    json.discription  @group.discription
    json.name         @group.name
    json.count        @group.count
    json.pics         @group.pics
    json.pics2        @group.pics2
    json.pics3        @group.pics3
    json.role         "owner"
  end
else
  json.msg "圈子创建失败"
  json.code 1
end
