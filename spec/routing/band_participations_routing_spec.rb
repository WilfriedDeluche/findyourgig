require "spec_helper"

describe BandParticipationsController do
  describe "routing" do

    it "routes to #index" do
      get("/my_bands").should route_to("band_participations#index")
    end

    it "routes to #request_participation" do
      put("/my_bands/1/set_administration_rights").should route_to("band_participations#set_administration_rights", :id => "1")
    end

    it "routes to #members" do
      put("/my_bands/3/activate").should route_to("band_participations#activate", :id => "3")
    end

    it "routes to #destroy" do
      delete("/my_bands/10").should route_to("band_participations#destroy", :id => "10")
    end

  end
end
