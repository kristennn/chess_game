if @tbl_playerinfo.present?
  json.code 0
  json.msg "ok"
  json.time params[:time]
  json.apiurl "/api/game/users/shareActivity.html"
  json.ApiHash "4b50512c9c732419a0d992ab9cd202bc"
  json.data do
    json.add_InsureScore 1
    json.add_Score 0
  end
else
  json.code 1
  json.msg "玩家不存在"
end
