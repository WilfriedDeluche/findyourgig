class Venue < ActiveRecord::Base
	default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}

  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :telephone, :email_address, :website, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates_presence_of :name, :address_1, :postal_code, :city, :country
  validates :address_1, :uniqueness => { :scope => :city, :message => I18n.t('venue_uniqueness') }

	def address
    country_code = Carmen::Country.coded(country)
	  [address_1, postal_code, city, country_code.name].compact.join(', ') unless country_code.nil?
	end  

  def address_changed?
    address_1_changed? || postal_code_changed? || city_changed? || country_changed?
  end

end
