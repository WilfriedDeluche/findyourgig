require 'spec_helper'

describe GigsController do
  include Devise::TestHelpers

  # This should return the minimal set of attributes required to create a valid
  # Gig. As you add validations to Gig, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { venue_id: "1", name: "Some Band On Tour", description: "Some band on tour sometime somewhere", soundcheck_time: "2013-04-02 15:00:00", doors_time: "2013-04-02 18:30:00", concert_start_time: "2013-04-02 19:00:00", concert_end_time: "2013-04-02 23:00:00" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GigsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @user = FactoryGirl.create(:user, :email => "manager@venue1.com", :role => "venue_manager")
    @user_2 = FactoryGirl.create(:user, :email => "member@band1.com", :role => "band_member")

    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save

    @band = FactoryGirl.create(:band)

    @manager = FactoryGirl.create(:managership, :user => @user, :venue => @venue)
    @member = FactoryGirl.create(:band_participation, :user => @user_2, :band => @band, :is_admin => true){ |bp| bp.pending = false }

    @gig = FactoryGirl.create(:gig, :name => "Concert Live", :venue => @venue)
  end

  describe "GET index" do

    before(:each) do
      @gig_2 = FactoryGirl.create(:gig, :name => "World Tour", :venue => @venue)
      @gig_3 = FactoryGirl.create(:gig, :name => "Concert Accoustique", :venue => @venue)
      @gig_4 = FactoryGirl.create(:gig, :name => "European Tour", :venue => @venue)
    end

    it "assigns all venues as @gigs" do
      get :index, {}
      assigns(:gigs).size.should eq 4

      assigns(:gigs).should include @gig
      assigns(:gigs).should include @gig_2
      assigns(:gigs).should include @gig_3
      assigns(:gigs).should include @gig_4

      response.should be_success
      response.should render_template "index"
    end

    it "assigns gigs by first letter" do
      get :index, {:by_letter => "C"}
      assigns(:gigs).size.should eq 2
      assigns(:gigs).should include @gig
      assigns(:gigs).should include @gig_3
      assigns(:gigs).should_not include @gig_2
      assigns(:gigs).should_not include @gig_4
      response.should be_success

      get :index, {:by_letter => "E"}
      assigns(:gigs).size.should eq 1
      assigns(:gigs).should include @gig_4
      response.should be_success
    end

    it "assigns gigs with search" do
      get :index, {:search => "tour"}
      assigns(:gigs).size.should eq 2
      assigns(:gigs).should include @gig_2
      assigns(:gigs).should include @gig_4
      assigns(:gigs).should_not include @gig
      assigns(:gigs).should_not include @gig_3
      response.should be_success

      get :index, {:search => "toto"}
      assigns(:gigs).should be_empty
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested venue as @gig" do
      get :show, {:id => @gig.to_param}
      assigns(:gig).should eq @gig
      response.should be_success
      response.should render_template "show"
    end

    it "redirect to index when ID unknown" do
      @gig.destroy
      get :show, {:id => @gig.to_param}
      response.should redirect_to gigs_url
    end

    it "assigns no main act nor supporting acts exists when none" do
      get :show, {:id => @gig.to_param}
      assigns(:main_act).should be_nil
      assigns(:supporting_acts).should be_empty
    end

    it "assigns main act and supporting acts exists when any" do
      @gig.build_main_act(:band_id => @band.id, :is_main_act => true)
      @gig.supporting_acts.build(:band_id => FactoryGirl.create(:band).id, :is_main_act => false)
      @gig.save

      get :show, {:id => @gig.to_param}
      assigns(:main_act).should_not be_nil
      assigns(:main_act).band.should eq @band
      assigns(:supporting_acts).should_not be_empty
    end
  end

  describe "Routes that Requires Authentication" do

    before(:each) do
      @venue_2 = FactoryGirl.build(:venue){ |venue| venue.skip_geocoding = true }
      @venue_2.save
      @venue_3 = FactoryGirl.build(:venue){ |venue| venue.skip_geocoding = true }
      @venue_3.save
      @venue_4 = FactoryGirl.build(:venue){ |venue| venue.skip_geocoding = true }
      @venue_4.save

      @band_2 = FactoryGirl.create(:band)
      @band_3 = FactoryGirl.create(:band)
      @band_4 = FactoryGirl.create(:band)
      @band_5 = FactoryGirl.create(:band)

      @manager_2 = FactoryGirl.create(:managership, :user => @user, :venue => @venue_2)
      @member_2 = FactoryGirl.create(:band_participation, :user => @user_2, :band => @band_2, :is_admin => false){ |bp| bp.pending = false }
      @member_3 = FactoryGirl.create(:band_participation, :user => @user_2, :band => @band_5, :is_admin => false){ |bp| bp.pending = false }
    end

    describe "GET new" do
      it "assigns a new gig as @gig" do
        sign_in @user
        get :new, {}
        assigns(:gig).should be_a_new(Gig)
        response.should be_success
        response.should render_template "new"
      end

      it "should build default main_act and supporting_acts" do
        sign_in @user
        get :new, {}
        assigns(:main_act).should be_a_new(Act)
        assigns(:supporting_acts).size.should eq 4
        assigns(:supporting_acts).each { |supporting_act| supporting_act.should be_a_new(Act) }
      end
    end

    describe "GET edit" do
      it "assigns the requested venue as @gig" do
        sign_in @user
        get :edit, {:id => @gig.to_param}
        assigns(:gig).should eq(@gig)
        response.should be_success
        response.should render_template "edit"
      end

      it "should assigns gig's main_act and supporting_acts" do
        @gig.build_main_act(:band_id => @band_2.id, :is_main_act => true).save
        @gig.supporting_acts.create(:band_id => @band.id, :is_main_act => false)
        @gig.supporting_acts.create(:band_id => @band_4.id, :is_main_act => false)

        sign_in @user
        get :edit, {:id => @gig.to_param}
        assigns(:main_act).should be_persisted
        assigns(:main_act).band.should eq @band_2
        assigns(:supporting_acts).size.should eq 4
        assigns(:supporting_acts).collect(&:band).should include @band
        assigns(:supporting_acts).collect(&:band).should include @band_4
      end
    end

    describe "as a Venue Manager" do
      it "should assigns only managerships as @venues for form and all @bands" do
        [:new, :edit].each do |action|
          params = action == :new ? {} : {:id => @gig.to_param}
          sign_in @user
          get action, params
          assigns(:venues).size.should eq 2
          assigns(:venues).should include @venue
          assigns(:venues).should include @venue_2

          assigns(:bands).size.should eq 5
        end
      end

      it "should assigns @venues with only venue_id when specified" do
        [:new, :edit].each do |action|
          params = action == :new ? {:venue_id => @venue_2.id} : {:venue_id => @venue_2.id, :id => @gig.to_param}
          sign_in @user
          get action, params
          assigns(:venues).size.should eq 1
          assigns(:venues).should_not include @venue
          assigns(:venues).should include @venue_2
        end
      end
    end

    describe "as a Band Member" do
      it "should assigns only band_participations as @bands for form and all @venues" do
        [:new, :edit].each do |action|
          params = action == :new ? {} : {:id => @gig.to_param}
          sign_in @user_2
          get action, params
          assigns(:venues).size.should eq 4

          assigns(:bands).size.should eq 3
          assigns(:bands).should include @band
          assigns(:bands).should include @band_2
          assigns(:bands).should include @band_5
        end
      end

      it "should assigns @bands with only band_id when specified" do
        [:new, :edit].each do |action|
          params = action == :new ? {:band_id => @band_5.id} : {:band_id => @band_5.id, :id => @gig.to_param}
          sign_in @user_2
          get action, params
          assigns(:bands).size.should eq 1
          assigns(:bands).should_not include @band
          assigns(:bands).should_not include @band_2
          assigns(:bands).should include @band_5
        end
      end
    end

    describe "as an Admin" do
      it ":new should not be accessible" do
        admin = FactoryGirl.build(:user, :email => "admin@fyg.com", :role => "admin") { |u| u.force_create = true }
        admin.save
        sign_in admin
        get :new, {}
        response.should redirect_to gigs_path
        flash[:alert].should_not be_nil
      end
    end

    # describe "POST create" do
    #   describe "with valid params" do
    #     it "creates a new Gig" do
    #       expect {
    #         post :create, {:gig => valid_attributes}, valid_session
    #       }.to change(Gig, :count).by(1)
    #     end

    #     it "assigns a newly created gig as @gig" do
    #       post :create, {:gig => valid_attributes}, valid_session
    #       assigns(:gig).should be_a(Gig)
    #       assigns(:gig).should be_persisted
    #     end

    #     it "redirects to the created gig" do
    #       post :create, {:gig => valid_attributes}, valid_session
    #       response.should redirect_to(Gig.last)
    #     end
    #   end

    #   describe "with invalid params" do
    #     it "assigns a newly created but unsaved gig as @gig" do
    #       # Trigger the behavior that occurs when invalid params are submitted
    #       Gig.any_instance.stub(:save).and_return(false)
    #       post :create, {:gig => { "name" => "invalid value" }}, valid_session
    #       assigns(:gig).should be_a_new(Gig)
    #     end

    #     it "re-renders the 'new' template" do
    #       # Trigger the behavior that occurs when invalid params are submitted
    #       Gig.any_instance.stub(:save).and_return(false)
    #       post :create, {:gig => { "name" => "invalid value" }}, valid_session
    #       response.should render_template("new")
    #     end
    #   end
    # end

    # describe "PUT update" do
    #   describe "with valid params" do
    #     it "updates the requested gig" do
    #       gig = Gig.create! valid_attributes
    #       # Assuming there are no other gigs in the database, this
    #       # specifies that the Gig created on the previous line
    #       # receives the :update_attributes message with whatever params are
    #       # submitted in the request.
    #       Gig.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
    #       put :update, {:id => gig.to_param, :gig => { "name" => "MyString" }}, valid_session
    #     end

    #     it "assigns the requested gig as @gig" do
    #       gig = Gig.create! valid_attributes
    #       put :update, {:id => gig.to_param, :gig => valid_attributes}, valid_session
    #       assigns(:gig).should eq(gig)
    #     end

    #     it "redirects to the gig" do
    #       gig = Gig.create! valid_attributes
    #       put :update, {:id => gig.to_param, :gig => valid_attributes}, valid_session
    #       response.should redirect_to(gig)
    #     end
    #   end

    #   describe "with invalid params" do
    #     it "assigns the gig as @gig" do
    #       gig = Gig.create! valid_attributes
    #       # Trigger the behavior that occurs when invalid params are submitted
    #       Gig.any_instance.stub(:save).and_return(false)
    #       put :update, {:id => gig.to_param, :gig => { "name" => "invalid value" }}, valid_session
    #       assigns(:gig).should eq(gig)
    #     end

    #     it "re-renders the 'edit' template" do
    #       gig = Gig.create! valid_attributes
    #       # Trigger the behavior that occurs when invalid params are submitted
    #       Gig.any_instance.stub(:save).and_return(false)
    #       put :update, {:id => gig.to_param, :gig => { "name" => "invalid value" }}, valid_session
    #       response.should render_template("edit")
    #     end
    #   end
    # end
  end

  # describe "DELETE destroy" do
  #   it "destroys the requested gig" do
  #     gig = Gig.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => gig.to_param}, valid_session
  #     }.to change(Gig, :count).by(-1)
  #   end

  #   it "redirects to the gigs list" do
  #     gig = Gig.create! valid_attributes
  #     delete :destroy, {:id => gig.to_param}, valid_session
  #     response.should redirect_to(gigs_url)
  #   end
  # end

end
