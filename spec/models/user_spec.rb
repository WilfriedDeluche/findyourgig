require 'spec_helper'

describe User, focus: true do
  it "has none to begin with" do
    User.count.should == 0
  end

  it "has one after adding one" do
    user = FactoryGirl.create(:user)
    User.count.should == 1
  end

  it "has required fields missing" do
    user = FactoryGirl.build(:user, :first_name => "", :last_name => "")
    user.should be_invalid
    user.should have(1).error_on(:last_name)
    user.should have(1).error_on(:first_name)
  end

  it "has an invalid email" do
    user = FactoryGirl.build(:user, :email => "allo.allo.com")
    user.should be_invalid
    user.should have(1).error_on(:email)
  end

  it "has a password not matching confirmation" do
    user = FactoryGirl.build(:user, :password => "blabla", :password_confirmation => "blibli")
    user.should be_invalid
    user.should have(1).error_on(:password)
  end

  it "should render correct Name" do
    user = FactoryGirl.create(:user, :first_name => "willIAm", :last_name => "Martin")
    user.name.should eq "William MARTIN"
  end

  it "should include availables roles only" do
    User.available_roles.include?("admin").should eq true
    User.available_roles.include?("band_member").should eq true
    User.available_roles.include?("venue_manager").should eq true
    User.available_roles.include?("vip").should eq false
  end

end
