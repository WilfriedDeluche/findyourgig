require 'spec_helper'

describe VenuesHelper do

  it "should return distance displayed according to Country code" do
    # United Kingdom
    location_1_1 = FactoryGirl.create(:venue, address_1: "22 Blenheim Gardens", postal_code: "SW2", city: "Brixton", country: "GB")
    location_1_2 = FactoryGirl.create(:venue, address_1: "93 Lower Richmond Road", postal_code: "SW15", city: "Putney", country: "GB")
    helper.distance_display(location_1_1.nearbys(10).first).should include "miles" 

     # France
    location_2_1 = FactoryGirl.create(:venue, address_1: "7-9 Rue des Petites Ecuries", postal_code: "75010", city: "Paris", country: "FR")
    location_2_2 = FactoryGirl.create(:venue, address_1: "21 Rue Yves Toudic", postal_code: "75010", city: "Paris", country: "FR")
    helper.distance_display(location_2_1.nearbys(5).first).should include "km"

    # Spain
    location_3_1 = FactoryGirl.create(:venue, address_1: "Plaza de Espana 9", postal_code: "28008", city: "Madrid", country: "ES")
    location_3_2 = FactoryGirl.create(:venue, address_1: "Calle de la Palma 62", postal_code: "28015", city: "Madrid", country: "ES")
    helper.distance_display(location_3_1.nearbys(5).first).should include "km"
  end
end
