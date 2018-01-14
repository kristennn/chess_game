json.code 0
json.msg "已查询到圈子列表"
json.group do
  json.array! @groups do |group|
    json.id group.id
    json.discription group.discription
    json.name group.name
    json.count group.count
    json.pics group.pics
  end
end
