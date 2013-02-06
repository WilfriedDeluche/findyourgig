class BandParticipation < ActiveRecord::Base
  belongs_to :user
  belongs_to :band

  attr_accessible :band_id, :date_joined, :date_left, :is_admin, :user_id

  validate :user_has_role_band_member

  def user_has_role_band_member
    errors[:base] << "User is not a band member and cannot be included in this band" unless user.has_role? :band_member
  end
end
