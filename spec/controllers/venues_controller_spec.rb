require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VenuesController do

  # This should return the minimal set of attributes required to create a valid
  # Venue. As you add validations to Venue, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "the Venue", "postal_code" => "75003", "address_1" =>  "12, rue de Rivoli", "city" => "Paris", "country" => "FRANCE" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VenuesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @venue = FactoryGirl.create(:venue)
  end

  describe "GET index" do

    before(:each) do
      @venue_2 = FactoryGirl.create(:venue, name: "Swatch Store", address_1: "134, rue de Rivoli", postal_code: "75001")
      @venue_3 = FactoryGirl.create(:venue, name: "Heyraud", address_1: "90, rue de Rivoli", postal_code: "75004")
    end

    it "assigns all venues as @venues" do
      get :index, {}, valid_session
      assigns(:venues).size.should eq 3

      assigns(:venues).should include @venue
      assigns(:venues).should include @venue_2
      assigns(:venues).should include @venue_3

      response.should be_success
      response.should render_template "index"
    end

    it "assigns venues by first letter" do
      get :index, {:by_letter => "H"}, valid_session
      assigns(:venues).size.should eq 2
      assigns(:venues).should include @venue
      assigns(:venues).should include @venue_3
      assigns(:venues).should_not include @venue_2
      response.should be_success

      get :index, {:by_letter => "S"}, valid_session
      assigns(:venues).size.should eq 1
      assigns(:venues).should include @venue_2
      response.should be_success
    end

    it "assigns venues with search" do
      get :index, {:search => "heyr"}, valid_session
      assigns(:venues).size.should eq 1
      assigns(:venues).should include @venue_3
      response.should be_success

      get :index, {:search => "blabla"}, valid_session
      assigns(:venues).should be_empty
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested venue as @venue" do
      get :show, {:id => @venue.to_param}, valid_session
      assigns(:venue).should eq @venue
      response.should be_success
      response.should render_template "show"
    end

    it "redirect to index when ID unknown" do
      @venue.destroy
      get :show, {:id => @venue.to_param}, valid_session
      response.should redirect_to venues_url
    end
  end

  describe "GET new" do
    it "assigns a new venue as @venue" do
      get :new, {}, valid_session
      assigns(:venue).should be_a_new(Venue)
      response.should be_success
      response.should render_template "new"
    end
  end

  describe "GET edit" do
    it "assigns the requested venue as @venue" do
      get :edit, {:id => @venue.to_param}, valid_session
      assigns(:venue).should eq(@venue)
      response.should be_success
      response.should render_template "edit"
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Venue" do
        expect {
          post :create, {:venue => valid_attributes}, valid_session
        }.to change(Venue, :count).by(1)
      end

      it "assigns a newly created venue as @venue" do
        post :create, {:venue => valid_attributes}, valid_session
        assigns(:venue).should be_a(Venue)
        assigns(:venue).should be_persisted
      end

      it "redirects to the created venue" do
        post :create, {:venue => valid_attributes}, valid_session
        response.should redirect_to(Venue.unscoped.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved venue as @venue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        post :create, {:venue => { "name" => "invalid value" }}, valid_session
        assigns(:venue).should be_a_new(Venue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        post :create, {:venue => { "name" => "" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested venue" do
        venue = Venue.create! valid_attributes
        # Assuming there are no other venues in the database, this
        # specifies that the Venue created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Venue.any_instance.should_receive(:update_attributes).with({ "name" => "New hotel" })
        put :update, {:id => @venue.to_param, :venue => { "name" => "New hotel" }}, valid_session
      end

      it "assigns the requested venue as @venue" do
        put :update, {:id => @venue.to_param, :venue => valid_attributes}, valid_session
        assigns(:venue).should eq(@venue)
      end

      it "redirects to the venue" do
        put :update, {:id => @venue.to_param, :venue => valid_attributes}, valid_session
        response.should redirect_to(@venue)
      end
    end

    describe "with invalid params" do
      it "assigns the venue as @venue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @venue.to_param, :venue => { "name" => "" }}, valid_session
        assigns(:venue).should eq(@venue)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @venue.to_param, :venue => { "name" => "" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested venue" do
      expect {
        delete :destroy, {:id => @venue.to_param}, valid_session
      }.to change(Venue, :count).by(-1)
    end

    it "redirects to the venues list" do
      delete :destroy, {:id => @venue.to_param}, valid_session
      response.should redirect_to(venues_url)
    end
  end

end
