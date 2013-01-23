require 'spec_helper'

describe User do
  it "has none to begin with" do
    User.count.should == 0
  end

  it "has one after adding one" do
    user = FactoryGirl.create(:user)
    User.count.should == 1
    user.roles_list.should include("band_member")
  end

  it "has required fields missing" do
    user = FactoryGirl.build(:user, :first_name => "", :last_name => "", :role => "")
    user.should be_invalid
    user.should have(1).error_on(:last_name)
    user.should have(1).error_on(:first_name)
    user.should have(2).error_on(:role)
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

  it "should include available roles only" do
    User.available_roles.include?("admin").should eq true
    User.available_roles.include?("band_member").should eq true
    User.available_roles.include?("venue_manager").should eq true
    User.available_roles.include?("vip").should eq false
  end

  it "should include available roles for public only" do
    User.available_roles_for_public.include?("admin").should eq false
    User.available_roles_for_public.include?("band_member").should eq true
    User.available_roles_for_public.include?("venue_manager").should eq true
  end

  it "has an active account" do
    user = FactoryGirl.create(:user)
    user.account_active?.should eq true
  end

  it "has NOT an active account" do
    user = FactoryGirl.create(:user)
    user.roles.each { |role| role.destroy }
    user.reload.account_active?.should eq false
  end

  it "can be ADMIN if force create" do
    user = FactoryGirl.create(:user, :role => "admin", :force_create => "1")
    user.roles_list.should include("admin")
  end

end
