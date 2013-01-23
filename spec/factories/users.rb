# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email, 1) { |n| "john@bates_#{n}.com" }
    u.password "alloallo"
    u.password_confirmation "alloallo"
    u.first_name "John"
    u.last_name "Bates"
    u.role "band_member"
  end
end
