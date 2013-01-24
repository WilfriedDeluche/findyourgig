class Venue < ActiveRecord::Base
  attr_accessible :name, :address_1, :address_2, :postal_code, :city, :country, :"telephone", :email_address, :website
end
