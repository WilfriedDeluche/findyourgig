class Venue < ActiveRecord::Base
	default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}

  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :telephone, :email_address, :website

  validates_presence_of :name, :address_1, :postal_code, :city, :country
  validates :address_1, :uniqueness => { :scope => :city, :message => I18n.t('venue_uniqueness') }
  
end
