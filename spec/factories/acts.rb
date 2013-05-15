# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :act do |act|
    act.gig :gig
    act.band :band
    act.is_main_act false
  end
end
