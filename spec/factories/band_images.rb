# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band_image do |image|
    image.is_main false
    image.band :band
  end
end
