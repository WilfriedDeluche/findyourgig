# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :managership do |man|
    man.venue :venue
    man.user :user
    man.is_admin true
  end
end
