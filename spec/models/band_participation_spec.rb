require 'spec_helper'

describe BandParticipation do

  before :each do
    @user = FactoryGirl.create(:user)
    @band = FactoryGirl.create(:band)
  end

  it "has none to begin with" do
    BandParticipation.count.should == 0
  end

  it "has one after adding one" do
    bp = FactoryGirl.create(:band_participation, :user => @user, :band => @band)
    BandParticipation.count.should == 1
  end

  it "has required fields missing" do
    bp = FactoryGirl.build(:band_participation, :date_joined => "", :user => nil, :band => nil)
    bp.should be_invalid
    bp.should have(1).error_on(:date_joined)
    bp.should have(1).error_on(:user_id)
    bp.should have(1).error_on(:band_id)
  end

  it "should render correct attributes" do
    bp = FactoryGirl.create(:band_participation, :user => @user, :band => @band, :date_joined => Date.today, :is_admin => false)
    bp.user.should eq @user
    bp.band.should eq @band
    bp.is_admin.should eq false
    bp.date_joined.should eq Date.today
  end

  it "should validates uniqueness of band in scope user" do
    bp = FactoryGirl.create(:band_participation, :user => @user, :band => @band)
    bp.should be_valid

    bp_2 = FactoryGirl.build(:band_participation, :user => @user, :band => @band)
    bp_2.should be_invalid
    bp_2.should have(1).error_on(:band_id)
  end

  it "should validate that user has role band_member" do
    user_2 = FactoryGirl.build(:user, :role => "admin"){ |u| u.force_create = true }
    user_2.save
    bp = FactoryGirl.build(:band_participation, :user => user_2, :band => @band)
    bp.should be_invalid
    bp.should have(1).error_on(:base)
  end
end
