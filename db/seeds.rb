# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(:email=>"dinemedia_admin@gmail.com", :password=>'password', :password_confirmation=>'password')
Admin.create(:email=>"svrforms@gmail.com", :password=>'bangalore@123', :password_confirmation=>'bangalore@123')
Admin.create(:email=>"smaranreddy123@gmail.com", :password=>'bhel@123', :password_confirmation=>'bhel@123')