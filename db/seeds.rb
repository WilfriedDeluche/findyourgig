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
venue_1 = Venue.create! name: "Batofar", address_1: "Port de la Gare", address_2: "", postal_code: "75013", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 1: 
	#{venue_1.name} 
	#{venue_1.address_1} 
	#{venue_1.address_2} 
	#{venue_1.postalcode} #{venue_1.city} 
	#{venue_1.country} 
	#{venue_1.telephone} 
	#{venue_1.email_address} 
	#{venue_1.website}"

venue_2 = Venue.create! name: "Le Trabendo", address_1: "211 Avenue Jean Jaurès", address_2: "", postal_code: "75019", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 2: 
	#{venue_2.name} 
	#{venue_2.address_1} 
	#{venue_2.address_2} 
	#{venue_2.postalcode} #{venue_2.city} 
	#{venue_2.country} 
	#{venue_2.telephone} 
	#{venue_2.email_address} 
	#{venue_2.website}"

venue_3 = Venue.create! name: "Le Divan du Monde", address_1: "75 Rue des Martyrs", address_2: "", postal_code: "75018", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 3: 
	#{venue_3.name} 
	#{venue_3.address_1} 
	#{venue_3.address_2} 
	#{venue_3.postalcode} #{venue_3.city} 
	#{venue_3.country} 
	#{venue_3.telephone} 
	#{venue_3.email_address} 
	#{venue_3.website}"

venue_4 = Venue.create! name: "La Boule Noire", address_1: "120 Boulevard de Rochechouart", address_2: "", postal_code: "75018", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 4: 
	#{venue_4.name} 
	#{venue_4.address_1} 
	#{venue_4.address_2} 
	#{venue_4.postalcode} #{venue_4.city} 
	#{venue_4.country} 
	#{venue_4.telephone} 
	#{venue_4.email_address} 
	#{venue_4.website}"

venue_5 = Venue.create! name: "Le Klub", address_1: "14 rue Saint-Denis", address_2: "", postal_code: "75001", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 5: 
	#{venue_5.name} 
	#{venue_5.address_1} 
	#{venue_5.address_2} 
	#{venue_5.postalcode} #{venue_5.city} 
	#{venue_5.country} 
	#{venue_5.telephone} 
	#{venue_5.email_address} 
	#{venue_5.website}"

venue_6 = Venue.create! name: "Guinness Tavern", address_1: "31 Rue des Lombards", address_2: "", postal_code: "75001", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 6: 
	#{venue_6.name} 
	#{venue_6.address_1} 
	#{venue_6.address_2} 
	#{venue_6.postalcode} #{venue_6.city} 
	#{venue_6.country} 
	#{venue_6.telephone} 
	#{venue_6.email_address} 
	#{venue_6.website}"

venue_7 = Venue.create! name: "Le Bateau Ivre", address_1: "40 Rue Descartes", address_2: "", postal_code: "75005", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 7: 
	#{venue_7.name} 
	#{venue_7.address_1} 
	#{venue_7.address_2} 
	#{venue_7.postalcode} #{venue_7.city} 
	#{venue_7.country} 
	#{venue_7.telephone} 
	#{venue_7.email_address} 
	#{venue_7.website}"

venue_8 = Venue.create! name: "Black Dog", address_1: "26 Rue des Lombards", address_2: "", postal_code: "75004", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 8: 
	#{venue_8.name} 
	#{venue_8.address_1} 
	#{venue_8.address_2} 
	#{venue_8.postalcode} #{venue_8.city} 
	#{venue_8.country} 
	#{venue_8.telephone} 
	#{venue_8.email_address} 
	#{venue_8.website}"

venue_9 = Venue.create! name: "Alhambra", address_1: "21 Rue Yves Toudic", address_2: "", postal_code: "75010", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 9: 
	#{venue_9.name} 
	#{venue_9.address_1} 
	#{venue_9.address_2} 
	#{venue_9.postalcode} #{venue_9.city} 
	#{venue_9.country} 
	#{venue_9.telephone} 
	#{venue_9.email_address} 
	#{venue_9.website}"

venue_10 = Venue.create! name: "New Morning", address_1: "7-9 Rue des Petites Écuries", address_2: "", postal_code: "75010", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 10: 
	#{venue_10.name} 
	#{venue_10.address_1} 
	#{venue_10.address_2} 
	#{venue_10.postalcode} #{venue_10.city} 
	#{venue_10.country} 
	#{venue_10.telephone} 
	#{venue_10.email_address} 
	#{venue_10.website}"

venue_11 = Venue.create! name: "Le Gibus", address_1: "18 Rue du Faubourg du Temple", address_2: "", postal_code: "75011", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 11: 
	#{venue_11.name} 
	#{venue_11.address_1} 
	#{venue_11.address_2} 
	#{venue_11.postalcode} #{venue_11.city} 
	#{venue_11.country} 
	#{venue_11.telephone} 
	#{venue_11.email_address} 
	#{venue_11.website}"

venue_12 = Venue.create! name: "Elysée Montmartre", address_1: "72 Boulevard de Rochechouart", address_2: "", postal_code: "75018", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 12: 
	#{venue_12.name} 
	#{venue_12.address_1} 
	#{venue_12.address_2} 
	#{venue_12.postalcode} #{venue_12.city} 
	#{venue_12.country} 
	#{venue_12.telephone} 
	#{venue_12.email_address} 
	#{venue_12.website}"

venue_13 = Venue.create! name: "Bataclan", address_1: "50 Boulevard Voltaire", address_2: "", postal_code: "75010", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 13: 
	#{venue_13.name} 
	#{venue_13.address_1} 
	#{venue_13.address_2} 
	#{venue_13.postalcode} #{venue_13.city} 
	#{venue_13.country} 
	#{venue_13.telephone} 
	#{venue_13.email_address} 
	#{venue_13.website}"

venue_14 = Venue.create! name: "La Maroquinerie", address_1: "23 Rue Boyer", address_2: "", postal_code: "75020", city: "Paris", country: "France" telephone: "" email_address: "" website: "" do |v|
  v.force_create = true
end
puts "Venue 14: 
	#{venue_14.name} 
	#{venue_14.address_1} 
	#{venue_14.address_2} 
	#{venue_14.postalcode} #{venue_14.city} 
	#{venue_14.country} 
	#{venue_14.telephone} 
	#{venue_14.email_address} 
	#{venue_14.website}"


