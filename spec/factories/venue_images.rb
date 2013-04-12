# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue_image do |image|
    image.is_main false
    image.venue :venue
  end
end
