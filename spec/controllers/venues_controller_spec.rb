require 'spec_helper'

describe VenuesController do
  include Devise::TestHelpers

  # This should return the minimal set of attributes required to create a valid
  # Venue. As you add validations to Venue, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "the Venue", "postal_code" => "75003", "address_1" => "125, rue de Rivoli", "city" => "Paris", "country" => "FR" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VenuesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save

    @user = FactoryGirl.create(:user, :email => "manager@venue1.com", :role => "venue_manager")
    @user_2 = FactoryGirl.build(:user, :email => "admin@admin.com", :role => "admin") { |u| u.force_create = true }
    @user_2.save

    @manager = FactoryGirl.create(:managership, :user => @user, :venue => @venue)
  end

  describe "GET index" do

    before(:each) do
      @venue_2 = FactoryGirl.build(:venue, name: "Swatch Store", address_1: "134, rue de Rivoli", postal_code: "75001") { |venue| venue.skip_geocoding = true }
      @venue_2.save
      @venue_3 = FactoryGirl.build(:venue, name: "Heyraud", address_1: "90, rue de Rivoli", postal_code: "75004") { |venue| venue.skip_geocoding = true }
      @venue_3.save
    end

    it "assigns all venues as @venues" do
      get :index, {}
      assigns(:venues).size.should eq 3

      assigns(:venues).should include @venue
      assigns(:venues).should include @venue_2
      assigns(:venues).should include @venue_3

      response.should be_success
      response.should render_template "index"
    end

    it "assigns venues by first letter" do
      get :index, {:by_letter => "H"}
      assigns(:venues).size.should eq 2
      assigns(:venues).should include @venue
      assigns(:venues).should include @venue_3
      assigns(:venues).should_not include @venue_2
      response.should be_success

      get :index, {:by_letter => "S"}
      assigns(:venues).size.should eq 1
      assigns(:venues).should include @venue_2
      response.should be_success
    end

    it "assigns venues with search" do
      get :index, {:search => "heyr"}
      assigns(:venues).size.should eq 1
      assigns(:venues).should include @venue_3
      response.should be_success

      get :index, {:search => "blabla"}
      assigns(:venues).should be_empty
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested venue as @venue" do
      get :show, {:id => @venue.to_param}
      assigns(:venue).should eq @venue
      response.should be_success
      response.should render_template "show"
    end

    it "redirect to index when ID unknown" do
      @venue.destroy
      get :show, {:id => @venue.to_param}
      response.should redirect_to venues_url
    end
  end

  describe "GET new" do
    it "assigns a new venue as @venue" do
      sign_in @user
      get :new, {}
      assigns(:venue).should be_a_new(Venue)
      response.should be_success
      response.should render_template "new"
    end

    it "should not be accessible when user not venue_manager" do
      sign_in @user_2
      get :new
      response.should redirect_to venues_path
      flash[:alert].should_not be_nil
    end
  end

  describe "GET edit" do
    it "assigns the requested venue as @venue" do
      sign_in @user
      get :edit, {:id => @venue.to_param}
      assigns(:venue).should eq(@venue)
      response.should be_success
      response.should render_template "edit"
    end
  end

  describe "POST create" do

    it "should not be accessible when user not venue_manager" do
      sign_in @user_2
      post :create, {:venue => valid_attributes}
      response.should redirect_to venues_path
      flash[:alert].should_not be_nil
    end

    before(:each) { sign_in @user }

    describe "with valid params" do
      it "creates a new Venue" do
        expect {
          post :create, {:venue => valid_attributes}
        }.to change(Venue, :count).by(1)
      end

      it "assigns a newly created venue as @venue" do
        post :create, {:venue => valid_attributes}
        assigns(:venue).should be_a(Venue)
        assigns(:venue).should be_persisted
      end

      it "redirects to the created venue" do
        post :create, {:venue => valid_attributes}
        response.should redirect_to(Venue.unscoped.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved venue as @venue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        post :create, {:venue => { "name" => "invalid value" }}
        assigns(:venue).should be_a_new(Venue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        post :create, {:venue => { "name" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    before(:each) { sign_in @user }

    describe "with valid params" do
      it "updates the requested venue" do
        venue = Venue.create! valid_attributes
        # Assuming there are no other venues in the database, this
        # specifies that the Venue created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Venue.any_instance.should_receive(:update_attributes).with({ "name" => "New hotel" })
        put :update, {:id => @venue.to_param, :venue => { "name" => "New hotel" }}
      end

      it "assigns the requested venue as @venue" do
        put :update, {:id => @venue.to_param, :venue => valid_attributes}
        assigns(:venue).should eq(@venue)
      end

      it "redirects to the venue" do
        put :update, {:id => @venue.to_param, :venue => valid_attributes}
        response.should redirect_to(@venue)
      end
    end

    describe "with invalid params" do
      it "assigns the venue as @venue" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @venue.to_param, :venue => { "name" => "" }}
        assigns(:venue).should eq(@venue)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Venue.any_instance.stub(:save).and_return(false)
        put :update, {:id => @venue.to_param, :venue => { "name" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) { sign_in @user }

    it "destroys the requested venue" do
      expect {
        delete :destroy, {:id => @venue.to_param}
      }.to change(Venue, :count).by(-1)
    end

    it "redirects to the venues list" do
      delete :destroy, {:id => @venue.to_param}
      response.should redirect_to(managerships_url)
    end
  end

  describe "Pages Only ACCESSIBLE to Managers" do
    it "should not be accessible when user not manager of the selected venue" do
      user_3 = FactoryGirl.create(:user, :email => "manager@venue3.com", :role => "venue_manager")
      sign_in user_3

      [:edit, :update, :destroy].each do |action|
        get action, {:id => @venue.to_param, :venue => action == :update ? valid_attributes : nil}
        response.should redirect_to venues_path
        flash[:alert].should_not be_nil
      end
    end
  end

end
