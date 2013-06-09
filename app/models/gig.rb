class Gig < ActiveRecord::Base
  default_scope order('concert_start_time ASC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}
  scope :by_search, lambda { |search| { :conditions => ["lower(name) LIKE ?", "%#{search}%"] }}
  scope :upcoming, where("concert_start_time > ?", DateTime.now)
  
  belongs_to :venue
  has_many :acts, dependent: :destroy
  has_many :bands, through: :acts

  has_one :main_act, class_name: Act, :inverse_of => :gig, conditions: { is_main_act: true }
  has_many :supporting_acts, class_name: Act, :inverse_of => :gig, conditions: { is_main_act: false }

  accepts_nested_attributes_for :main_act, :supporting_acts, allow_destroy: true, :reject_if => proc { |attributes| attributes['band_id'].blank? }

  mount_uploader :poster, GigPosterUploader

  attr_accessor :user_gold

  attr_accessible :concert_end_time, :concert_start_time, :description, :doors_time, :name, :soundcheck_time, :venue_id,
                  :main_act_attributes, :supporting_acts_attributes, :poster, :poster_cache, :remote_poster_url

  validates_presence_of :concert_start_time, :description, :doors_time, :name, :venue_id
  validate :concert_start_time_okay, :concert_end_time_okay, :doors_time_okay, :venue_in_managerships, :main_act_in_bands

  after_destroy :remove_upload_folder

	def doors_time_okay
    return if soundcheck_time.blank? || doors_time.blank?
  	errors.add :doors_time, I18n.t('incorrect_doors_time') if doors_time < soundcheck_time
  end

  def concert_start_time_okay
    return if concert_start_time.blank? || doors_time.blank?
  	errors.add :concert_start_time, I18n.t('incorrect_concert_start_time') if concert_start_time < doors_time
  end

  def concert_end_time_okay
    return if concert_start_time.blank? || concert_end_time.blank?
  	errors.add :concert_end_time, I18n.t('incorrect_concert_end_time') if concert_end_time < concert_start_time
  end

  def venue_in_managerships
    return unless self.venue && self.user_gold && self.user_gold.is_venue_manager?
    errors.add :venue_id, I18n.t('invalid') unless self.venue.in_managerships?(self.user_gold.managerships)
  end

  def main_act_in_bands
    return unless self.main_act && self.user_gold && self.user_gold.is_band_member?
    errors.add :main_act, I18n.t('invalid') unless self.main_act.band.in_band_participations?(self.user_gold.band_participations)
  end

  def remove_upload_folder
    FileUtils.remove_dir("#{Rails.root}/public/uploads/gigs/#{self.id}", :force => true)
  end
end
