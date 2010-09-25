# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Seed the system with an admin users
Admin.all.each do |a|
  a.destroy
end
user = Admin.create! do |u|
  u.email = "bradphelan@xtargets.com" 
  u.password = "foobar"
  u.password_confirmation = "foobar"
  u.remember_me = false
end
