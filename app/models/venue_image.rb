require 'carrierwave/orm/activerecord'

class VenueImage < ActiveRecord::Base

  mount_uploader :file, VenueImageUploader

  belongs_to :venue

  attr_accessible :file, :is_main, :venue_id

  validates_presence_of :venue_id, :file
end
