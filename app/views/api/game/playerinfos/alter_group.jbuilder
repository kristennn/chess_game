if @player == @group.player
  @group.update( :name => params[:name]) if params[:name].present?
  @group.update( :discription => params[:discription]) if params[:discription].present?
  @group.update( :count => params[:count]) if params[:count].present?
  @group.update( :pics => params[:img1]) if params[:img1].present?
  @group.update( :pics2 => params[:img2]) if params[:img2].present?
  @group.update( :pics3 => params[:img3]) if params[:img3].present?
  json.code 0
  json.msg "成功更新圈子信息"
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
  json.code 1
  json.msg "无权限"
end
