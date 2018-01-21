if @tbl_account.present?
  json.code 0
  json.msg "ok"
  json.time params[:time]
  json.apiurl "/api/game/marquees/getPaomatiao.html"
  json.ApiHash "4b50512c9c732419a0d992ab9cd202bc"
  json.data ""
  json.paomatiao_list do
    json.array! @marquees do |marquee|
      json.content     marquee.post
    end
  end
else
  json.code 1
  json.msg "玩家不存在"
end
