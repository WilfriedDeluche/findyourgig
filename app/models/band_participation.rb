class BandParticipation < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  
  attr_accessible :band_id, :date_joined, :date_left, :is_admin, :user_id
end
