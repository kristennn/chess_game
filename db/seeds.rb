# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个文档会建立多个用户"

User.create(:name => "manager", :email => "lala@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "manager")

5.times do |i|
  User.create(:name => "县级代理商#{i}号", :email => "salerone#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "县级代理", :rate => "0.8")
end

5.times do |i|
  User.create(:name => "城市合伙人商#{i}号", :email => "salertwo#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "城市合伙人", :salerid => "5", :rate => "0.6")
end

5.times do |i|
  User.create(:name => "普通代理商#{i}号", :email => "salerthree#{i}@gmail.com", :password => "123456", :password_confirmation => "123456", :permission => "普通代理", :salerid => "10", :rate => "0.2")
end

5.times do |i|
  TblAccount.create(:account => "玩家#{i+50}号", :saler => "5")
end

puts "创建成功"
