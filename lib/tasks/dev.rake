namespace :dev do
  task :fake => :environment do
     100.times do |i|
       tbl_account = TblAccount.create!( :account => Faker::Cat.name, :pwd => "12345678",
                                         :phone_num => "15540162345",
                                         :ip => "199.168.199.233",
                                         :login_time => Time.now,

                                         :logout_time => Faker::Time,
                                         :create_time => Time.now - rand(10).days - rand(24).hours )
     end
   end
   task :fake_tbl_rooms => :environment do
     20.times do |i|
       tbl_room = TblRoom.create!(:table_code => "6778",
                                  :time => Time.now,
                                  :players => "80234 80976 40566",
                                  :mode => "1",
                                  :seat_cnt => "12",
                                  :fee => "30",
                                  :end_time => Time.now + rand(3).days)

     end

  end
end
