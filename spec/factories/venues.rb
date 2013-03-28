# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do |v|
    v.sequence(:name, 1) { |n| "Hotel #{n}" }
    v.sequence(:address_1, 1) { |n| "#{n}, rue de Rivoli" }
    v.address_2 ""
    v.postal_code "75001"
    v.city "Paris"
    v.country "FR"
    v.telephone "0156324111"
    v.email_address "mail1@email.com"
    v.website "www.site.com"
  end
end
