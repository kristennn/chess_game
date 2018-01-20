namespace :dev do
  task :fake => :environment do
     100.times do |i|
       tbl_account = TblAccount.create!( :account => Faker::Cat.name, :pwd => "12345678",
                                         :phone_num => Faker::PhoneNumber.cell_phone,
                                         :ip => Faker::Internet.ip_v4_address,
                                         :login_time => Faker::Time.between(5.days.ago, Date.today, :evening),
                                         :logout_time => Faker::Time.between(2.days.ago, Date.today, :evening),
                                         :create_time => Time.now - rand(10).days - rand(24).hours )
     end
   end
   task :fake_tbl_rooms => :environment do
     20.times do |i|
       tbl_room = TblRoom.create!(:table_code => "6778",
                                  :time => Time.now,
                                  :players => "80234 80976 40566",
                                  :mode => "1",
                                  :seat_cnt => Faker::Number.between(1, 100),
                                  :fee => Faker::Number.between(20, 50),
                                  :end_time => Time.now + rand(3).days)

     end

  end

  task :update_diamond => :environment do
    puts "Fetch city data..."
    response = RestClient.get "http://47.100.117.210:8691/update_data", :params => { :name => $diamond }
    data = JSON.parse(response.body)

  end

end
