class Gig < ActiveRecord::Base
  attr_accessible :concert_end_time, :concert_start_time, :description, :doors_time, :name, :soundcheck_time
end
