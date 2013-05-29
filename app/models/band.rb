class Band < ActiveRecord::Base
  default_scope order('created_at DESC')
  scope :by_letter, lambda { |letter| { :conditions => ["lower(name) LIKE ?", "#{letter}%"] }}

  has_many :band_participations, dependent: :destroy
  has_many :users, through: :band_participations
  has_many :acts, dependent: :destroy
  has_many :gigs, through: :acts

  attr_accessible :city, :creation_year, :description, :name

  validates_presence_of :name, :creation_year
end
