class Band < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}

  has_many :band_participations, dependent: :destroy
  has_many :users, through: :band_participations
  has_many :band_images, dependent: :destroy
  has_many :acts, dependent: :destroy
  has_many :gigs, through: :acts

  has_one :main_image, class_name: BandImage, conditions: { is_main: true }

  attr_accessible :city, :creation_year, :description, :name

  validates_presence_of :name, :creation_year

  after_destroy :remove_upload_folder

  def remove_upload_folder
    FileUtils.remove_dir("#{Rails.root}/public/uploads/bands/#{self.id}", :force => true)
  end

  def in_band_participations?(participations)
     participations.detect { |member| member.band_id == self.id }
  end
end
