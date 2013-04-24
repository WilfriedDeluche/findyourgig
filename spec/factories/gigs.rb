# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gig do
    name "MyString"
    description "MyText"
    soundcheck_time "2013-03-27 16:07:33"
    doors_time "2013-03-27 16:07:33"
    concert_start_time "2013-03-27 16:07:33"
    concert_end_time "2013-03-27 16:07:33"
    venue_id "1"
  end
end
