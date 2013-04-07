require 'carrierwave/orm/activerecord'

class VenueImage < ActiveRecord::Base
  default_scope order('created_at DESC')

  mount_uploader :file, VenueImageUploader

  belongs_to :venue

  attr_accessible :file, :is_main, :venue_id, :file_cache, :remote_file_url

  validates_presence_of :venue_id, :file
end
