require "spec_helper"

describe VenueImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/venues/1/images").should route_to("venue_images#index", :venue_id => "1")
    end

    it "routes to #show" do
      get("/venues/1/images/3").should route_to("venue_images#show", :venue_id => "1", :id => "3")
    end

    it "routes to #create" do
      post("/venues/1/images").should route_to("venue_images#create", :venue_id => "1")
    end

    it "routes to #set_main" do
      put("/venues/1/images/2/set_main").should route_to("venue_images#set_main", :venue_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      delete("/venues/1/images/4").should route_to("venue_images#destroy", :venue_id => "1", :id => "4")
    end

  end
end
