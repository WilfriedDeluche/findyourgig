class Feedback < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  has_many :feedback_ratings

  attr_accessible :description, :rating, :venue_id, :user_id

  validates_presence_of :description, :rating, :venue_id, :user_id
  validates_inclusion_of :rating, :in => 0..5
  validates_uniqueness_of :user_id, scope: :venue_id
end
