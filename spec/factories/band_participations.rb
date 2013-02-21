# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band_participation do |bp|
    bp.band :band
    bp.user :user
    bp.date_joined "2013-02-06"
    bp.is_admin false
    bp.pending true
  end
end
