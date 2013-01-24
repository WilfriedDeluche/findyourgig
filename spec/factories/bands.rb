# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band do |b|
    b.sequence(:name, 1) { |n| "Band #{n}" }
    b.description "Description"
    b.creation_year 2006
    b.city "Paris"
  end
end
