class Venue < ActiveRecord::Base
  validates_presence_of :name, :address_1, :postal_code, :city, :country
  validates_uniqueness_of :address_1
  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :telephone, :email_address, :website
end
