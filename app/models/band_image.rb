require 'carrierwave/orm/activerecord'

class BandImage < ActiveRecord::Base
  default_scope order('created_at DESC')

  mount_uploader :file, BandImageUploader

  belongs_to :band

  attr_accessible :band_id, :file, :is_main, :file_cache, :remote_file_url

  validates_presence_of :band_id, :file

  before_create :set_is_main
  before_destroy :remove_file_and_folder

  def set_is_main
    self.is_main = true if self.band.band_images.count.zero?
  end

  def remove_file_and_folder
    store_dir = file.store_dir
    remove_file!
    FileUtils.remove_dir("#{Rails.root}/public/#{store_dir}", :force => true)
  end

  def previous
    self.band.band_images.where('band_images.id > ?', self.id).last
  end

  def next
    self.band.band_images.where('band_images.id < ?', self.id).first
  end
end
