class Gig < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}
  
  belongs_to :venue

  attr_accessible :concert_end_time, :concert_start_time, :description, :doors_time, :name, :soundcheck_time

  validates_presence_of :concert_start_time, :description, :doors_time, :name
end
