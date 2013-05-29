# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gig do |g|
    g.sequence(:name, 1) { |n| "Concert #{n}" }
    g.description "Description"
    g.soundcheck_time "2013-06-27 18:00:00"
    g.doors_time "2013-06-27 19:30:00"
    g.concert_start_time "2013-06-27 20:00:00"
    g.concert_end_time "2013-06-27 23:00:00"
    g.venue :venue
  end
end
