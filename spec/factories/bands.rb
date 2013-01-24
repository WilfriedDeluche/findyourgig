# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band do
    name "MyString"
    description "MyString"
    creation_year 1
    city "MyString"
  end
end
