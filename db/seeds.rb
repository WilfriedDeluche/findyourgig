# encoding: UTF-8
User.destroy_all
Role.destroy_all
Band.destroy_all

cities = %w(Paris Toulouse Bordeaux Nice Lille Saint-Denis Lyon Mulhouse Reims Arras Agen Saint-Etienne Créteil Bobigny Argenteuil Gonesse Montreuil)
years = (1995..2012).to_a
bands = ["Erase", "Groupe Sans Gain", "Fifteen Scars", "Jackson 5", "Little Mix", "The Black Eyed Peas", "Sugababes", "Indochine", "Jamiroquai", "Texas", "Destiny's Childs"]

# Roles
puts "ROLES"
User.available_roles.each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts "#{role} Role created"
end

# Default USERS
puts "USERS"
user_1 = User.create! email: "admin@findyourgig.com", password: "testtest", password_confirmation: "testtest", first_name: "John", last_name: "Bates", :role => "admin" do |u|
  u.force_create = true
end
puts "Admin : #{user_1.first_name} #{user_1.last_name}"

user_2 = User.create! email: "admin2@findyourgig.com", password: "testtest", password_confirmation: "testtest", first_name: "Katy", last_name: "Dockey", :role => "admin" do |u|
  u.force_create = true
end
puts "Admin : #{user_2.first_name} #{user_2.last_name}"

user_3 = User.create! email: "member@band1.com", password: "testtest", password_confirmation: "testtest", first_name: "Matthew", last_name: "Grant", :role => "band_member" do |u|
  u.force_create = true
end
puts "Band Member : #{user_3.first_name} #{user_3.last_name}"

# Default BANDS
puts "BANDS"
for n in 1..15 do
  band = Band.create! name: bands.sample, creation_year: years.sample, city: cities.sample, description: ""
  puts "Groupe : #{band.name} created in #{band.creation_year}"
end

# Default BAND PARTICIPATIONS
puts "BAND PARTICIPATIONS"
user_1.grant User::BAND_MEMBER
band_part_1 = user_1.band_participations.create! band_id: Band.first.id, is_admin: true, date_joined: Date.today
puts "#{band_part_1.user.first_name} #{band_part_1.user.last_name} is Admin Band member of #{band_part_1.band.name}"

band_part_2 = user_3.band_participations.create! band_id: Band.last.id, is_admin: true, date_joined: Date.today
puts "#{band_part_2.user.first_name} #{band_part_2.user.last_name} is Admin Band member of #{band_part_2.band.name}"

band_part_3 = user_1.band_participations.create! band_id: Band.last.id, is_admin: false, date_joined: Date.today
puts "#{band_part_3.user.first_name} #{band_part_3.user.last_name} is Band member of #{band_part_3.band.name}"