class Venue < ActiveRecord::Base
	default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}

  has_many :managerships, dependent: :destroy
  has_many :users, through: :managerships
  has_many :venue_images, dependent: :destroy

  has_one :main_image, class_name: VenueImage, conditions: { is_main: true }

  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :telephone, :email_address, :website, :latitude, :longitude

  attr_accessor :skip_geocoding

  validates_presence_of :name, :address_1, :postal_code, :city, :country
  validates :address_1, :uniqueness => { :scope => :city, :message => I18n.t('venue_uniqueness') }
  validate :country_code_exists

  geocoded_by :address
  acts_as_gmappable :process_geocoding => :geocode?,
                    :msg => I18n.t('unknown_gmaps_address')
  
  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
     "<h4>#{name}</h4>
     #{address}"  
  end

	def address
	  [address_1, postal_code, city, Carmen::Country.coded(country).name].compact.join(', ')
	end

  def geocode?
    return false if self.skip_geocoding || self.errors.any?
    self.address_changed? || latitude.blank? || longitude.blank?
  end

  def address_changed?
    address_1_changed? || postal_code_changed? || city_changed? || country_changed?
  end

  def country_code_exists
    errors.add :country, I18n.t('country_code_does_not_exist') if !country.blank? && Carmen::Country.coded(country).nil?
  end
end
