require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :locale => :fr
      response.should be_success
    end
  end

end
