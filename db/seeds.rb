# encoding: utf-8

User.destroy_all
Role.destroy_all
Band.destroy_all
Venue.destroy_all

cities = %w(Paris Toulouse Bordeaux Nice Lille Saint-Denis Lyon Mulhouse Reims Arras Agen Saint-Etienne Créteil Bobigny Argenteuil Gonesse Montreuil)
years = (1995..2012).to_a
bands = ["Erase", "Groupe Sans Gain", "Fifteen Scars", "Jackson 5", "Little Mix", "The Black Eyed Peas", "Sugababes", "Indochine", "Jamiroquai", "Texas", "Destiny's Childs"]
venues = ["Alhambra", "Bataclan", "Batofar", "Black Dog", "Elysée Montmartre", "Guinness Tavern", "La Boule Noire", "La Maroquinerie", "Le Bateau Ivre", "Le Divan du Monde", "Le Gibus", "Le Klub", "Le Trabendo", "New Morning"]
venue_addresses = ["21 Rue Yves Toudic", "50 Boulevard Voltaire", "Port de la Gare", "26 Rue des Lombards", "72 Boulevard de Rochechouart", "31 Rue des Lombards", "120 Boulevard de Rochechouart", "23 Rue Boyer", "40 Rue Descartes", "75 Rue des Martyrs", "18 Rue du Faubourg du Temple", "14 rue Saint-Denis", "211 Avenue Jean Jaurès", "7-9 Rue des Petites Écuries"]
venue_postal_codes = ["75010", "75010", "75013", "75004", "75018", "75001", "75018", "75020", "75005", "75018", "75011", "75001", "75019", "75010"]

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
for n in 1..14 do
	venue = Venue.create! name: venues[n-1], address_1: venue_addresses[n-1], address_2: "", postal_code: venue_postal_codes[n-1], city: "Paris", country: "FR", telephone: "", email_address: "", website: ""
  puts "Venue #{n}: 
  #{venue.name} 
  #{venue.address_1} 
  #{venue.postal_code} #{venue.city} 
  #{venue.country}"
end

# Default BAND
puts "BANDS"
for n in 1..15 do
  band = Band.create! name: bands.sample, creation_year: years.sample, city: cities.sample, description: ""
  puts "Groupe : #{band.name} created in #{band.creation_year}"
end
