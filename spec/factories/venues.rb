# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do |v|
    v.name "Hotel Meurise"
    v.address_1 "75001"
    v.address_2 ""
    v.postal_code "12, rue de Rivoli"
    v.city "Paris"
    v.country "FRANCE"
    v.telephone "0156324111"
    v.email_address "mail1@email.com"
    v.website "www.site.com"
  end
end
