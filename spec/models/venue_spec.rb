require 'spec_helper'

describe Venue do
  it "has none to begin with" do
    Venue.count.should == 0
  end

  it "has one after adding one" do
    venue = FactoryGirl.create(:venue)
    Venue.count.should == 1
  end

  it "has required fields missing" do
    venue = FactoryGirl.build(:venue, :name => "", :address_1 => "", :postal_code => "", :city => "", :country => "")
    venue.should be_invalid
    venue.should have(1).error_on(:name)
    venue.should have(1).error_on(:address_1)
    venue.should have(1).error_on(:postal_code)
    venue.should have(1).error_on(:city)
    venue.should have(1).error_on(:country)
  end

  it "should render correct attributes" do
    venue = FactoryGirl.create(:venue)
    venue.name.should         eq "Hotel Meurise"
    venue.address_1.should    eq "12, rue de Rivoli"
    venue.postal_code.should  eq "75001"
    venue.city.should         eq "Paris"
    venue.country.should      eq "FR"
    venue.telephone.should    eq "0156324111"
    venue.email_address.should eq "mail1@email.com"
    venue.website.should      eq "www.site.com"
  end

  it "should validates uniqueness of both address_1 and city" do
    venue = FactoryGirl.create(:venue, :address_1 => "1, rue de Versailles", :city => "Paris")
    venue.should be_valid

    venue_2 = FactoryGirl.build(:venue, :address_1 => "1, rue de Versailles", :city => "Paris")
    venue_2.should be_invalid
    venue_2.should have(1).error_on(:address_1)
  end

  it "should validate country code exists" do
    venue = FactoryGirl.build(:venue, :country => "AA")
    venue.should be_invalid
    venue.should have(1).error_on(:country)

    venue.country = "CB"
    venue.should be_invalid
    venue.should have(1).error_on(:country)

    venue.country = "CO" # Colombie
    venue.should be_valid
  end
end
