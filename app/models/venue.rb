class Venue < ActiveRecord::Base
  validates_presence_of :name, :address_1, :postal_code, :city, :country
  validates :address_1, :uniqueness => { :scope => :city, :message => I18n.t('venue_uniqueness') }
  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :telephone, :email_address, :website
end
