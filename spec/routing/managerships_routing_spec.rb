require "spec_helper"

describe ManagershipsController do
  describe "routing" do

    it "routes to #index" do
      get("/managerships").should route_to("managerships#index")
    end

    it "routes to #new" do
      get("/managerships/new").should route_to("managerships#new")
    end

    it "routes to #show" do
      get("/managerships/1").should route_to("managerships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/managerships/1/edit").should route_to("managerships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/managerships").should route_to("managerships#create")
    end

    it "routes to #update" do
      put("/managerships/1").should route_to("managerships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/managerships/1").should route_to("managerships#destroy", :id => "1")
    end

  end
end
