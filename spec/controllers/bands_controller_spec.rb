require 'spec_helper'

describe BandsController do
  include Devise::TestHelpers

  # This should return the minimal set of attributes required to create a valid
  # Band. As you add validations to Band, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "Band", "creation_year" => 2008 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BandsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @band = FactoryGirl.create(:band, :name => "Erase")
    @band_2 = FactoryGirl.create(:band, :name => "Bibi")

    @user = FactoryGirl.create(:user, :email => "member@band1.com", :role => "band_member")
    @user_2 = FactoryGirl.create(:user, :email => "member@band2.com", :role => "band_member")
    @user_3 = FactoryGirl.build(:user, :email => "admin@admin.com", :role => "admin") { |u| u.force_create = true }
    @user_3.save

    @bp = FactoryGirl.create(:band_participation, :user => @user, :band => @band)
    @bp_2 = FactoryGirl.create(:band_participation, :user => @user_2, :band => @band_2, :is_admin => true) do |bp|
      bp.pending = false
    end
  end

  describe "GET index" do

    before(:each) do
      @band_3 = FactoryGirl.create(:band, :name => "Dada")
      @band_4 = FactoryGirl.create(:band, :name => "Bobo")
    end
    it "assigns all bands as @bands" do
      get :index, {}, valid_session
      assigns(:bands).size.should eq 4

      assigns(:bands).should include @band
      assigns(:bands).should include @band_2
      assigns(:bands).should include @band_3
      assigns(:bands).should include @band_4

      response.should be_success
      response.should render_template "index"
    end

    it "assigns bands by first letter" do
      get :index, {:by_letter => "B"}, valid_session
      assigns(:bands).size.should eq 2
      assigns(:bands).should include @band_2
      assigns(:bands).should include @band_4
      response.should be_success

      get :index, {:by_letter => "D"}, valid_session
      assigns(:bands).size.should eq 1
      assigns(:bands).should include @band_3
      response.should be_success
    end

    it "assigns bands with search" do
      get :index, {:search => "bob"}, valid_session
      assigns(:bands).size.should eq 1
      assigns(:bands).should include @band_4
      response.should be_success

      get :index, {:search => "blabla"}, valid_session
      assigns(:bands).should be_empty
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested band as @band" do
      get :show, {:id => @band.to_param}, valid_session
      assigns(:band).should eq @band
      response.should be_success
      response.should render_template "show"
      flash.now[:info].should be_nil
    end

    it "redirect to index when ID unknown" do
      @band.destroy
      get :show, {:id => @band.to_param}, valid_session
      response.should redirect_to bands_url
    end

    it "displays flash info when current_user is pending member" do
      sign_in @user
      get :show, {:id => @band.to_param}
      flash.now[:info].should_not be_nil
    end
  end

  describe "GET new" do
    it "assigns a new band as @band" do
      sign_in @user
      get :new
      assigns(:band).should be_a_new Band
      response.should be_success
      response.should render_template "new"
    end

    it "should not be accessible when user not band_member" do
      sign_in @user_3
      get :new
      response.should redirect_to bands_path
      flash[:alert].should_not be_nil
    end
  end

  describe "GET edit" do
    it "assigns the requested band as @band" do
      sign_in @user_2
      get :edit, {:id => @band_2.to_param}
      assigns(:band).should eq @band_2
      response.should be_success
      response.should render_template "edit"
    end
  end

  describe "GET members" do
    it "assigns band members" do
      @bp_3 = FactoryGirl.create(:band_participation, :user => @user, :band => @band_2)
      sign_in @user_2

      get :members, {:id => @band_2.to_param}
      assigns(:band).should eq @band_2
      response.should be_success
      response.should render_template "members"

      assigns(:members).size.should eq 2
      assigns(:members).should_not include @bp
      assigns(:members).should include @bp_2
      assigns(:members).should include @bp_3
    end
  end

  describe "POST create" do

    it "should not be accessible when user not band_member" do
      sign_in @user_3
      post :create, {:band => valid_attributes}
      response.should redirect_to bands_path
      flash[:alert].should_not be_nil
    end

    before(:each) { sign_in @user }
      
    describe "with valid params" do
      it "creates a new Band" do
        expect {
          post :create, {:band => valid_attributes}
        }.to change(Band, :count).by 1
      end

      it "assigns a newly created band as @band" do
        post :create, {:band => valid_attributes}
        assigns(:band).should be_a Band
        assigns(:band).should be_persisted
      end

      it "redirects to the created band" do
        post :create, {:band => valid_attributes}
        response.should redirect_to Band.unscoped.last
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved band as @band" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        post :create, {:band => { "name" => "" }}
        assigns(:band).should be_a_new Band
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        post :create, {:band => { "name" => "" }}
        response.should render_template "new"
      end
    end
  end

  describe "PUT update" do

    before(:each) { sign_in @user_2 }

    describe "with valid params" do
      it "updates the requested band" do
        # Assuming there are no other bands in the database, this
        # specifies that the Band created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Band.any_instance.should_receive(:update_attributes).with({ "name" => "Bandddd" })
        put :update, {:id => @band_2.to_param, :band => { "name" => "Bandddd" }}
      end

      it "assigns the requested band as @band" do
        put :update, {:id => @band_2.to_param, :band => valid_attributes}
        assigns(:band).should eq @band_2
      end

      it "redirects to the band" do
        put :update, {:id => @band_2.to_param, :band => valid_attributes}
        response.should redirect_to @band_2
      end
    end

    describe "with invalid params" do
      it "assigns the band as @band" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        put :update, {:id => @band_2.to_param, :band => { "name" => "" }}
        assigns(:band).should eq @band_2
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        put :update, {:id => @band_2.to_param, :band => { "name" => "" }}
        response.should render_template "edit"
      end
    end
  end

  describe "PUT request_participation" do

    it "should not work if user already member" do
      sign_in @user
      put :request_participation, {:id => @band.to_param}
      response.should redirect_to band_participations_path
      flash[:alert].should_not be_nil
    end

    it "should add pending participation to user" do
      sign_in @user
      put :request_participation, {:id => @band_2.to_param}
      assigns(:participation).should be_pending
      response.should redirect_to @band_2
      flash[:notice].should_not be_nil
    end

    it "should not add pending participation when user does not have role band_member" do
      @user_3 = FactoryGirl.build(:user, :email => "admin_3@user.com", :role => "admin") do |u|
        u.force_create = true
      end
      @user_3.save
      sign_in @user_3
      put :request_participation, {:id => @band.to_param}
      assigns(:participation).should_not be_persisted
      response.should redirect_to @band
      flash[:notice].should be_nil
      flash[:alert].should_not be_nil
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested band" do
      sign_in @user_2
      expect {
        delete :destroy, {:id => @band_2.to_param}
      }.to change(Band, :count).by -1
    end

    it "redirects to the bands list" do
      sign_in @user_2
      delete :destroy, {:id => @band_2.to_param}
      response.should redirect_to bands_url
    end
  end

  describe "Pages Only ACCESSIBLE to Members Admin" do
    it "should not be accessible when user not band_member admin" do
      [:edit, :update, :members, :destroy].each do |action|
        sign_in @user
        get action, {:id => @band.to_param, :band => action == :update ? valid_attributes : nil}
        response.should redirect_to bands_path
        flash[:alert].should_not be_nil
      end
    end
  end

end
