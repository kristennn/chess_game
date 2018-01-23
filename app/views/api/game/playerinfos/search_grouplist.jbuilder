if @groups.present?
  json.code 0
  json.msg "已查询到圈子列表"
  json.group do
    json.array! @groups do |group|
      json.id           group.id
      json.discription  group.discription
      json.name         group.name
      json.count        group.count
      json.pics         group.pics
      if @player == group.player
        json.role       "owner"
      else
        json.role       "joined"
      end
    end
  end
else
  json.code 1
  json.msg "您还没有加入任何圈子，快去加入吧！"
end
