require 'spec_helper'

describe Managership do

  before :each do
    @user = FactoryGirl.create(:user, :role => "venue_manager")
    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save
  end

  it "has none to begin with" do
    Managership.count.should == 0
  end

  it "has one after adding one" do
    FactoryGirl.create(:managership, :user => @user, :venue => @venue)
    Managership.count.should == 1
  end

  it "has required fields missing" do
    management = FactoryGirl.build(:managership, :user => nil, :venue => nil)
    management.should be_invalid
    management.should have(1).error_on(:user_id)
    management.should have(1).error_on(:venue_id)
  end

  it "should render correct attributes" do
    management = FactoryGirl.create(:managership, :user => @user, :venue => @venue)
    management.user.should eq @user
    management.venue.should eq @venue
    management.is_admin.should eq true
  end

  it "should validates uniqueness of venue in scope user" do
    management = FactoryGirl.create(:managership, :user => @user, :venue => @venue)
    management.should be_valid

    management_2 = FactoryGirl.build(:managership, :user => @user, :venue => @venue)
    management_2.should be_invalid
    management_2.should have(1).error_on(:venue_id)
  end

  it "should validate that user has role venue_manager" do
    user_2 = FactoryGirl.build(:user, :role => "admin"){ |u| u.force_create = true }
    user_2.save
    management = FactoryGirl.build(:managership, :user => user_2, :venue => @venue)
    management.should be_invalid
    management.should have(1).error_on(:base)
  end
end
