require 'spec_helper'

describe ManagershipsController do

  # This should return the minimal set of attributes required to create a valid
  # Managership. As you add validations to Managership, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "is_admin" => "false" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ManagershipsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save

    @user = FactoryGirl.create(:user, :email => "manager@venue1.com", :role => "venue_manager")
    @user_2 = FactoryGirl.build(:user, :email => "admin@admin.com", :role => "admin") { |u| u.force_create = true }
    @user_2.save

    @management = FactoryGirl.create(:managership, :user => @user, :venue => @venue)
  end

  describe "GET index" do
    it "assigns all user's managerships as @managerships" do
      sign_in @user
      venue_2 = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
      venue_2.save
      management_2 = FactoryGirl.create(:managership, :user => @user, :venue => venue_2)

      user_3 = FactoryGirl.create(:user, :email => "manager@venue3.com", :role => "venue_manager")
      venue_3 = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
      venue_3.save
      management_3 = FactoryGirl.create(:managership, :user => user_3, :venue => venue_3)

      get :index
      assigns(:managerships).should_not be_nil
      assigns(:managerships).size.should eq 2
      assigns(:managerships).should include @management
      assigns(:managerships).should include management_2
      assigns(:managerships).should_not include management_3 # Belongs to other manager

      response.should be_success
      response.should render_template "index"
    end

    it "should not be ACCESSIBLE if user does not have role venue_manager" do
      sign_in @user_2

      get :index
      assigns(:managerships).should be_nil
      response.should redirect_to root_path
      flash[:alert].should_not be_nil
    end
  end

end
