class Gig < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}
  
  belongs_to :venue
  has_many :acts, dependent: :destroy
  has_many :bands, through: :acts

  has_one :main_act, class_name: Act, conditions: { is_main_act: true }
  has_many :supporting_acts, class_name: Act, conditions: { is_main_act: false }

  attr_accessible :concert_end_time, :concert_start_time, :description, :doors_time, :name, :soundcheck_time, :venue_id

  validates_presence_of :concert_start_time, :description, :doors_time, :name, :venue_id
  validate :concert_start_time_okay, :concert_end_time_okay, :doors_time_okay

	def doors_time_okay
  	errors.add :country, I18n.t('incorrect_doors_time') if !soundcheck_time.blank? && doors_time<soundcheck_time
  end

  def concert_start_time_okay
  	errors.add :country, I18n.t('incorrect_concert_start_time') if !doors_time.blank? && concert_start_time<doors_time
  end

  def concert_end_time_okay
  	errors.add :country, I18n.t('incorrect_concert_end_time') if !concert_end_time.blank? && concert_end_time<concert_start_time
  end
end
