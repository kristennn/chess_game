if @user == @group.player
  if params[:index].to_i == 1
    @group.update( :pics => params[:img])
    json.code 0
    json.msg "上传图片成功"
    json.group do
      json.pics         @group.pics
    end
  elsif params[:index].to_i == 2
    @group.update( :pics2 => params[:img])
    json.code 0
    json.msg "上传图片成功"
    json.group do
      json.pics2        @group.pics2
    end
  elsif params[:index].to_i == 3
    @group.update( :pics3 => params[:img])
    json.code 0
    json.msg "上传图片成功"
    json.group do
      json.pics3        @group.pics3
    end
  else
    json.msg "上传图片达到上限"
  end

else
  json.code 1
  json.msg "无权限"
end
