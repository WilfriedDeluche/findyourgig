require 'carrierwave/orm/activerecord'

class VenueImage < ActiveRecord::Base
  default_scope order('created_at DESC')

  mount_uploader :file, VenueImageUploader

  belongs_to :venue

  attr_accessible :file, :is_main, :venue_id, :file_cache, :remote_file_url

  validates_presence_of :venue_id, :file

  before_create :set_is_main
  before_destroy :remove_file_and_folder

  def set_is_main
    self.is_main = true if self.venue.venue_images.count.zero?
  end

  def remove_file_and_folder
    store_dir = file.store_dir
    remove_file!
    FileUtils.remove_dir("#{Rails.root}/public/#{store_dir}", :force => true)
  end

  def previous
    self.venue.venue_images.where('venue_images.id > ?', self.id).last
  end

  def next
    self.venue.venue_images.where('venue_images.id < ?', self.id).first
  end
end
