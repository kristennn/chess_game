if @tbl_account.present?
  json.code 0
  json.msg "ok"
  json.time params[:time]
  json.apiurl "/api/game/marquees/getPaomatiao.html"
  json.ApiHash "4b50512c9c732419a0d992ab9cd202bc"
  json.data ""
  json.paomatiao_list do
    json.array! @marquees do |marquee|
      json.id          marquee.id
      json.pack_id     0
      json.title       0
      json.content     marquee.post
      json.start_time  0
      json.end_time    0
      json.interval    0
      json.dateline    0
      json.admin_id    0
    end
  end
else
  json.code 1
  json.msg "玩家不存在"
end
