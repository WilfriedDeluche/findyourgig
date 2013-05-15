require 'spec_helper'

describe Act do
  it "has none to begin with" do
    Act.count.should == 0
  end

  before :each do
    @venue = FactoryGirl.create(:venue)
    @band = FactoryGirl.create(:band)
    @gig = FactoryGirl.create(:gig, :venue => @venue)
  end

  it "has one after adding one" do
    act = FactoryGirl.create(:act, :band => @band, :gig => @gig)
    Act.count.should == 1
  end

  it "has required fields missing" do
    act = FactoryGirl.build(:act, :band_id => "", :gig_id => "")
    act.should be_invalid
    act.should have(1).error_on(:band)
    act.should have(1).error_on(:gig)
  end

  it "should validates uniqueness of band_id in gig_id" do
    act = FactoryGirl.create(:act, :band => @band, :gig => @gig)
    act.should be_valid

    act_2 = FactoryGirl.build(:act, :band => @band, :gig => @gig)
    act_2.should be_invalid
    act_2.should have(1).error_on(:band_id)
  end
end
