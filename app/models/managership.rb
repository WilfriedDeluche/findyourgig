class Managership < ActiveRecord::Base

  belongs_to :user
  belongs_to :venue

  attr_accessible :user_id, :venue_id, :is_admin

  validates_presence_of :venue_id, :user_id
  validates_uniqueness_of :venue_id, scope: :user_id
  validate :user_has_role_venue_manager

  def user_has_role_venue_manager
    return if user.nil?
    errors[:base] << "User is not a venue manager and cannot manage this venue" unless user.has_role? :venue_manager
  end
end
