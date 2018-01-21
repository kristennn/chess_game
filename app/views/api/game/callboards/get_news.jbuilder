if @player.present?
  json.code 0
  json.msg "ok"
  json.time params[:time]
  json.apiurl "/api/game/callboards/getOneSystemNews.html"
  json.ApiHash "4b50512c9c732419a0d992ab9cd202bc"
  json.data ""
  json.date do
    json.array! @callboards do |callboard|
      json.content callboard.post
    end
  end
else
  json.code 1
  json.msg "玩家不存在"
end
