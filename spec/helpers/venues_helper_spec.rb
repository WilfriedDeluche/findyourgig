require 'spec_helper'

describe VenuesHelper do

  it "should return distance displayed according I18n locale" do
    # Small distance
    location_1_1 = FactoryGirl.create(:venue, address_1: "26 Rue des Lombards", postal_code: "75004", city: "Paris", country: "FR")
    location_1_2 = FactoryGirl.create(:venue, address_1: "31 Rue des Lombards", postal_code: "75001", city: "Paris", country: "FR")

    I18n.locale = :fr
    helper.distance_display(location_1_1.nearbys(10).first).should include "m"

    I18n.locale = :en
    helper.distance_display(location_1_1.nearbys(10).first).should include "yards"

     # Great distance
    location_2_1 = FactoryGirl.create(:venue, address_1: "7-9 Rue des Petites Ecuries", postal_code: "75001", city: "Paris", country: "FR")
    location_2_2 = FactoryGirl.create(:venue, address_1: "Port de la Gare", postal_code: "75013", city: "Paris", country: "FR")

    I18n.locale = :fr
    helper.distance_display(location_2_1.nearbys(5).first).should include "km"

    I18n.locale = :en
    helper.distance_display(location_2_1.nearbys(5).first).should include "miles"
  end
end
