# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band_image do
    file "MyString"
    is_main false
    band_id 1
  end
end
