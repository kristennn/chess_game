# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个文档会建立多个用户"


User.create(:name => "管理员", :email => "lala@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "manager")

10.times do |i|
  User.create(:name => "一级代理商#{i}号", :email => "salerone#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "salerone")
end

10.times do |i|
  User.create(:name => "二级代理商#{i}号", :email => "salertwo#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "salertwo", :salerid => "140")
end

10.times do |i|
  User.create(:name => "三级代理商#{i}号", :email => "salerthree#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "salerthree", :salerid => "150")
end

5.times do |i|
  TblAccount.create(:account => "玩家#{i+50}号", :saler => "140")
end

5.times do |i|
  TblAccount.create(:account => "玩家#{i+60}号", :saler => "150")
end

puts "创建成功"
