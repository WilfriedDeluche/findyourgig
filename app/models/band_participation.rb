class BandParticipation < ActiveRecord::Base
  scope :active, where(pending: false)

  belongs_to :user
  belongs_to :band

  attr_accessible :band_id, :date_joined, :is_admin, :user_id

  validates_presence_of :band_id, :user_id, :date_joined
  validates_uniqueness_of :band_id, scope: :user_id
  validate :user_has_role_band_member

  def user_has_role_band_member
    errors[:base] << "User is not a band member and cannot be included in this band" unless user.has_role? :band_member
  end
end
