require "spec_helper"

describe GigsController do
  describe "routing" do

    it "routes to #index" do
      get("/gigs").should route_to("gigs#index")
    end

    it "routes to #new" do
      get("/gigs/new").should route_to("gigs#new")
    end

    it "routes to #show" do
      get("/gigs/1").should route_to("gigs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gigs/1/edit").should route_to("gigs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gigs").should route_to("gigs#create")
    end

    it "routes to #update" do
      put("/gigs/1").should route_to("gigs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gigs/1").should route_to("gigs#destroy", :id => "1")
    end

  end
end
