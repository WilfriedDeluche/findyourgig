class Act < ActiveRecord::Base

  belongs_to :gig
  belongs_to :band

  attr_accessible :band_id, :gig_id, :is_main_act

  validates_presence_of :band_id, :gig_id
  validates_uniqueness_of :band_id, scope: :gig_id
end
