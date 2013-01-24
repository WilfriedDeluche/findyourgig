User.destroy_all
Role.destroy_all

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

# Default VENUE
puts "VENUE"
venue_1 = Venue.create! name: "Batofar", address_1: "Port de la Gare,", address_2: "", postal_code: "75013", city: "Paris", country: "Country" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue : #{venue_1.name} #{venue_1.address_1} #{venue_1.address_2} #{venue_1.postalcode} #{venue_1.city} #{venue_1.country} #{venue_1.telephone} #{venue_1.email_address} #{venue_1.website}"

