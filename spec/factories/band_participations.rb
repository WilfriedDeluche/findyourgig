# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band_participation do
    band_id 1
    user_id 1
    date_joined "2013-02-06"
    date_left "2013-02-06"
    is_admin false
  end
end
