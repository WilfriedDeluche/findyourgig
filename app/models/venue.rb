class Venue < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :name, :postalcode
end
