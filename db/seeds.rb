# encoding: utf-8

User.destroy_all
Role.destroy_all
Band.destroy_all
Venue.destroy_all
Gig.destroy_all

cities = %w(Paris Toulouse Bordeaux Nice Lille Saint-Denis Lyon Mulhouse Reims Arras Agen Saint-Etienne Créteil Bobigny Argenteuil Gonesse Montreuil)
years = (1995..2012).to_a
bands = ["Erase", "Groupe Sans Gain", "Fifteen Scars", "Jackson 5", "Little Mix", "The Black Eyed Peas", "Sugababes", "Indochine", "Jamiroquai", "Texas", "Destiny's Childs"]
venues = ["Alhambra", "Bataclan", "Batofar", "Black Dog", "Elysée Montmartre", "Guinness Tavern", "La Boule Noire", "La Maroquinerie", "Le Bateau Ivre", "Le Divan du Monde", "Le Gibus", "Le Klub", "Le Trabendo", "New Morning"]
venue_addresses = ["21 Rue Yves Toudic", "50 Boulevard Voltaire", "Port de la Gare", "26 Rue des Lombards", "72 Boulevard de Rochechouart", "31 Rue des Lombards", "120 Boulevard de Rochechouart", "23 Rue Boyer", "40 Rue Descartes", "75 Rue des Martyrs", "18 Rue du Faubourg du Temple", "14 rue Saint-Denis", "211 Avenue Jean Jaurès", "7-9 Rue des Petites Écuries"]
venue_postal_codes = ["75010", "75010", "75013", "75004", "75018", "75001", "75018", "75020", "75005", "75018", "75011", "75001", "75019", "75010"]
gig_names = ['On Tour', 'On The Road', 'Live']
gig_soundcheck_times = ['2013-04-02 15:00:00']
gig_doors_times = ['2013-04-02 19:30:00']
gig_concert_start_times = ['2013-04-02 20:00:00']
gig_concert_end_times = ['2013-04-02 23:00:00']
venue_latitudes = [48.8706729, 48.863063, 48.8348253, 48.8594245, 48.8829464, 48.8596071, 48.8822048, 48.8686811, 48.8456217, 48.8824218, 48.868199, 48.859013, 48.8890923, 48.8731796]
venue_longitudes = [2.3630652, 2.370815, 2.3771892, 2.3491133, 2.3437224, 2.3483502, 2.3401297, 2.3921303, 2.3491096, 2.3396141, 2.366387, 2.3478007, 2.394432, 2.353238]
venue_images_url = ["http://www.infoconcert.com/media/photos/ALHAMBRA.JPG", #Alhambra
          "http://www.bataclan.fr/bataclan_home_fr_uk.png", # Bataclan
          "http://www.com2daddy.com/upl/places/batofar-paris.jpg", # Batofar
          "http://p3.storage.canalblog.com/34/30/582605/60096518.jpg", # Black dog
          "http://myrebirth.fr/files/elysee_montmartre041.jpg", # Elysee Montmartre
          "",  # Guiness Tavern
          "http://www.bertrandsoulier.fr/wp-content/uploads/2011/11/La-Boule-Noire.png", # Boule Noire
          "http://www.le-hiboo.com/wp-content/uploads/2011/10/IMG_6297.jpg", # La Maroquinerie
          "", # Le Bateau Ivre
          "http://1.bp.blogspot.com/-WVvb_P9wS8U/Ttfjv7LInMI/AAAAAAAAAqw/6xQCzNXiHLM/s1600/Blog01.JPG",  # Le Divan du Monde
          "http://www.321salles.com/img/salles/243985-medium-le-gibus.jpg", # Le Gibus
          "http://3.bp.blogspot.com/-PLOidrmcG2E/T6mR46guDdI/AAAAAAAAAF4/rHBnsz8No7A/s1600/LOGO-KLUB-BLANC-1.jpg", # Le Klub
          "", # Le Trabendo
          "http://www.nouveau-paris-ile-de-france.fr/fichiers/fckeditor/Image/1185/fr/original/new-morning.jpg"] # New Morning
descriptions = ['Pas mal', 'Mouais', 'Top moumoute !', 'Super son !', 'Très sympa !']
ratings = [0..5].to_a

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

user_4 = User.create! email: "manager@venue1.com", password: "testtest", password_confirmation: "testtest", first_name: "Elisa", last_name: "Ferry", :role => "venue_manager"
puts "Venue Manager : #{user_4.first_name} #{user_4.last_name}"

user_5 = User.create! email: "manager@venue2.com", password: "testtest", password_confirmation: "testtest", first_name: "Eric", last_name: "Oliver", :role => "venue_manager"
puts "Venue Manager : #{user_5.first_name} #{user_5.last_name}"

user_6 = User.create! email: "manager@venue3.com", password: "testtest", password_confirmation: "testtest", first_name: "James", last_name: "Dicken", :role => "venue_manager"
puts "Venue Manager : #{user_6.first_name} #{user_6.last_name}"

venue_managers = [user_4, user_5, user_6]

# Default VENUE
puts "VENUE"
for n in 1..14 do
	venue = Venue.create name: venues[n-1], address_1: venue_addresses[n-1], address_2: "", postal_code: venue_postal_codes[n-1], city: "Paris", country: "FR", telephone: "", email_address: "", website: "" do |venue|
    venue.skip_geocoding = true
    venue.latitude = venue_latitudes[n-1]
    venue.longitude = venue_longitudes[n-1]
  end

  puts "Venue #{n}:
  #{venue.name} 
  #{venue.address_1} 
  #{venue.postal_code} #{venue.city} 
  #{venue.country}"

  unless venue_images_url[n-1].blank?
    venue.venue_images.create(remote_file_url: venue_images_url[n-1], is_main: true)
    puts "Main picture set"
  else
    puts "No main picture"
  end

  #Adds Default MANAGERSHIP
  manager = venue_managers.sample
  venue.managerships.create! user_id: manager.id, is_admin: true
  puts "#{manager.first_name} #{manager.last_name} is Manager of the venue #{venue.name}" 
end

gig_venues = Venue.all.collect{ |venue| venue.id }

# Default BANDS
puts "BANDS"
for n in 1..15 do
  band = Band.create! name: bands.sample, creation_year: years.sample, city: cities.sample, description: ""
  puts "Groupe : #{band.name} created in #{band.creation_year}"
end

# Default BAND PARTICIPATIONS
puts "BAND PARTICIPATIONS"
user_1.grant User::BAND_MEMBER
band_part_1 = user_1.band_participations.create! band_id: Band.first.id, is_admin: true, date_joined: Date.today do |p|
  p.pending = false
end
puts "#{band_part_1.user.first_name} #{band_part_1.user.last_name} is Admin Band member of #{band_part_1.band.name}"

band_part_2 = user_3.band_participations.create! band_id: Band.last.id, is_admin: true, date_joined: Date.today do |p|
  p.pending = false
end
puts "#{band_part_2.user.first_name} #{band_part_2.user.last_name} is Admin Band member of #{band_part_2.band.name}"

band_part_3 = user_1.band_participations.create! band_id: Band.last.id, is_admin: false, date_joined: Date.today do |p|
  p.pending = false
end
puts "#{band_part_3.user.first_name} #{band_part_3.user.last_name} is Band member of #{band_part_3.band.name}"

puts "GIGS"
for n in 1..15 do
  gig = Gig.new venue_id: gig_venues.sample, name: gig_names.sample, description: "something", soundcheck_time: gig_soundcheck_times.sample, doors_time: gig_doors_times.sample, concert_start_time: gig_concert_start_times.sample, concert_end_time: gig_concert_end_times.sample
  gig.description = "#{gig.name} at #{gig.venue.name}"
  gig.save
  puts "Gig : #{gig.description} on #{gig.concert_start_time}"
end

my_gig = Gig.new venue_id: gig_venues.sample, name: "Gig Name", description: "Gig Description", soundcheck_time: gig_soundcheck_times.sample, doors_time: gig_doors_times.sample, concert_start_time: gig_concert_start_times.sample, concert_end_time: gig_concert_end_times.sample
my_gig.save
puts "Gig : #{my_gig.description} on #{my_gig.concert_start_time}"

puts "FEEDBACKS"
for n in 1..15 do
  feedback = Feedback.new description: descriptions.sample, rating: ratings.sample, venue_id: gig_venues.sample, user_id: user_3.id
  feedback.save
  puts "Feedback : #{feedback.description} 
  Rating: #{feedback.rating} out of 5
  Venue: #{feedback.venue_id}
  #{feedback.user_id}
  #{feedback.created_at}"
end

