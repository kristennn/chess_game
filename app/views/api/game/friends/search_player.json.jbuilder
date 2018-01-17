json.code 0
json.msg "搜索结果如下"
json.players do
  json.array! @followers do |follower|
    json.uid follower.userid
  end
end
