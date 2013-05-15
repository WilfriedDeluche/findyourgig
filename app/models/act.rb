class Act < ActiveRecord::Base

  belongs_to :gig, :inverse_of => :main_act
  belongs_to :gig, :inverse_of => :supporting_acts
  belongs_to :band

  attr_accessible :band_id, :gig_id, :is_main_act

  validates_presence_of :band, :gig
  validates_uniqueness_of :band_id, scope: :gig_id
end
