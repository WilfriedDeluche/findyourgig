require "spec_helper"

describe BandImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/bands/1/images").should route_to("band_images#index", :band_id => "1")
    end

    it "routes to #show" do
      get("/bands/1/images/3").should route_to("band_images#show", :band_id => "1", :id => "3")
    end

    it "routes to #create" do
      post("/bands/1/images").should route_to("band_images#create", :band_id => "1")
    end

    it "routes to #set_main" do
      put("/bands/1/images/2/set_main").should route_to("band_images#set_main", :band_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      delete("/bands/1/images/4").should route_to("band_images#destroy", :band_id => "1", :id => "4")
    end

  end
end
