require "spec_helper"

describe BandImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/band_images").should route_to("band_images#index")
    end

    it "routes to #new" do
      get("/band_images/new").should route_to("band_images#new")
    end

    it "routes to #show" do
      get("/band_images/1").should route_to("band_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/band_images/1/edit").should route_to("band_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/band_images").should route_to("band_images#create")
    end

    it "routes to #update" do
      put("/band_images/1").should route_to("band_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/band_images/1").should route_to("band_images#destroy", :id => "1")
    end

  end
end
