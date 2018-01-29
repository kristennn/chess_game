if @user.present?
  json.code 0
  json.msg "所有圈子列表"
  json.groups do
    json.array! @groups do |group|
      record = GroupRecord.where("group_records.userid =? AND group_records.group_msg_id =? AND group_records.is_join =?", params[:userid], group.id, true)
        json.id           group.id
        json.discription  group.discription
        json.name         group.name
        json.count        group.count
        json.pics         group.pics
        json.numpeople    group.players.count
        if @user == group.player
          json.role "owner"
        elsif @user != group.player && @user.is_player_of?(group)
          json.role "joined"
        elsif @user != group.player
          json.role "unjoined"
        end
        if record.present?
          json.role "submited"
        end
    end
  end
else
  json.code 1
  json.msg "用户不存在，无法查看圈子信息"
end
