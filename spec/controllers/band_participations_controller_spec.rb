require 'spec_helper'

describe BandParticipationsController do
  include Devise::TestHelpers

  # This should return the minimal set of attributes required to create a valid
  # BandParticipation. As you add validations to BandParticipation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BandParticipationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @band = FactoryGirl.create(:band, :name => "Erase")
    @band_2 = FactoryGirl.create(:band, :name => "Bibi")

    @user = FactoryGirl.create(:user, :email => "member@bp1.com", :role => "band_member")
    @user_2 = FactoryGirl.create(:user, :email => "member@bp2.com", :role => "band_member")

    @bp = FactoryGirl.build(:band_participation, :user => @user, :band => @band, :is_admin => true){ |bp| bp.pending = false }
    @bp.save
    @bp_2 = FactoryGirl.build(:band_participation, :user => @user_2, :band => @band_2){ |bp| bp.pending = false }
    @bp_2.save
    @bp_3 = FactoryGirl.create(:band_participation, :user => @user_2, :band => @band)

    sign_in @user
  end

  describe "GET index" do

    it "assigns user's active band_participations as @participations" do
      band_3 = FactoryGirl.create(:band, :name => "Fifteen Scars")
      bp_3 = FactoryGirl.build(:band_participation, :user => @user, :band => @band_2){ |bp| bp.pending = false }
      bp_3.save
      bp_4 = FactoryGirl.create(:band_participation, :user => @user, :band => band_3)

      get :index
      assigns(:participations).should_not be_nil
      assigns(:participations).size.should eq 2
      assigns(:participations).should include @bp
      assigns(:participations).should include bp_3
      assigns(:participations).should_not include bp_4 # Pending

      response.should be_success
      response.should render_template "index"
    end

    it "should not be ACCESSIBLE if user does not have role band_member" do
      user_2 = FactoryGirl.build(:user, :role => "admin"){ |u| u.force_create = true }
      user_2.save
      sign_in user_2

      get :index
      assigns(:participations).should be_nil
      response.should redirect_to root_path
      flash[:alert].should_not be_nil
    end
  end

  describe "ACTIVATE band_participation" do

    it "should update band participation and redirect_to members page" do
      BandParticipation.any_instance.should_receive(:update_attribute).with(:pending, false)
      put :activate, {:id => @bp_3.to_param}
      assigns(:bp).should eq @bp_3
      response.should redirect_to members_band_path(@bp_3.band)
      flash[:notice].should_not be_nil
    end

    it "should NOT update band participation if already active" do
      @bp_3.update_attribute(:pending, false)

      BandParticipation.any_instance.should_not_receive(:update_attribute)
      put :activate, {:id => @bp_3.to_param}
      response.should redirect_to members_band_path(@bp_3.band)
    end
  end

  describe "SET ADMIN RIGHTS for band_participation" do
    
    it "changes is_admin value and redirect_to members page" do
      BandParticipation.any_instance.should_receive(:update_attribute).with(:is_admin, true)
      put :set_administration_rights, {:id => @bp_3.to_param}
      assigns(:bp).should eq @bp_3
      response.should redirect_to members_band_path(@bp_3.band)
      flash[:notice].should_not be_nil
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested band_participation if current_user owns band_participation" do
      expect {
        delete :destroy, {:id => @bp.to_param}
      }.to change(BandParticipation, :count).by -1
    end

    it "redirects to the band_participations list and flashes notice" do
      delete :destroy, {:id => @bp.to_param}
      response.should redirect_to band_participations_path
      flash[:notice].should_not be_nil
    end

    it "does NOT destroy the requested band_participation if current_user doesn't own band_participation" do
      expect {
        delete :destroy, {:id => @bp_2.to_param}
        response.should redirect_to root_path
        flash[:alert].should_not be_nil
      }.to change(BandParticipation, :count).by 0
    end
  end

  describe "Pages Only ACCESSIBLE to Members Admin" do
    
    it "should not be accessible when user not band_participation_member admin" do
      [:activate, :set_administration_rights].each do |action|
        put action, {:id => @bp_2.to_param}
        response.should redirect_to bands_path
        flash[:alert].should_not be_nil
      end
    end
  end

  describe "Band Participation record does not exist" do
    
    it "should redirect to root_path" do
      [:activate, :set_administration_rights].each do |action|
        put action, {:id => "49384983"}
        response.should redirect_to root_path
        flash[:alert].should_not be_nil
      end
    end
  end
end
