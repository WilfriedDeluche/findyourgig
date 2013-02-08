require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :locale => :fr
      response.should be_success
    end

    it "redirects to browser locale if exists and no locale has been defined in params" do
      # Browser sends FR as locale : available
      request.env['HTTP_ACCEPT_LANGUAGE'] = "fr-FR"
      get 'index', :locale => nil
      response.should redirect_to root_path(:locale => "fr")

      # Browser sends EN as locale : available
      request.env['HTTP_ACCEPT_LANGUAGE'] = "en-EN"
      get 'index', :locale => nil
      response.should redirect_to root_path(:locale => "en")

      # Browser sends no locale : default_locale is used
      request.env['HTTP_ACCEPT_LANGUAGE'] = ""
      get 'index', :locale => nil
      response.should redirect_to root_path(:locale => "fr")

      # Browser sends IT as locale : not available -> default_locale is used
      debugger
      request.env['HTTP_ACCEPT_LANGUAGE'] = "it-IT"
      get 'index', :locale => nil
      response.should redirect_to root_path(:locale => "fr")
    end
  end
end
