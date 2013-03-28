require "spec_helper"

describe ManagershipsController do
  describe "routing" do

    it "routes to #index" do
      get("/my_venues").should route_to("managerships#index")
    end

  end
end
