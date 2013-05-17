class Feedback < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
  has_many :feedback_ratings

  attr_accessible :description, :rating, :venue_id, :user_id

  validates_presence_of :description, :rating, :venue_id, :user_id
  validates_inclusion_of :rating, in: 0..5, allow_nil: true, message: "La note doit etre incluse entre 0 et 5"
  validates_uniqueness_of :user_id, scope: :venue_id, message: "Vous avez deja poste un message pour cette salle"

  def self.user_for_venue_exists?(user, venue)
    return false if user.blank? || venue.blank?
    venue.feedbacks.where(venue_id: venue.id, user_id: user.id).any?
  end
end
