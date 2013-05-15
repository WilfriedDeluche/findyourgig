require 'spec_helper'

describe Gig do
  it "has none to begin with" do
    Gig.count.should == 0
  end

  before :each do
    @venue = FactoryGirl.create(:venue)
  end

  it "has one after adding one" do
    gig = FactoryGirl.create(:gig, :venue => @venue)
    Gig.count.should == 1
  end

  it "has required fields missing" do
    gig = FactoryGirl.build(:gig, :name => "", :venue_id => "", :concert_start_time => "", :doors_time => "", :description => "")
    gig.should be_invalid
    gig.should have(1).error_on(:name)
    gig.should have(1).error_on(:venue_id)
    gig.should have(1).error_on(:concert_start_time)
    gig.should have(1).error_on(:doors_time)
    gig.should have(1).error_on(:description)
  end

  it "should validate doors_time_okay" do
    gig = FactoryGirl.build(:gig, :doors_time => "2013-06-27 18:00:00", :soundcheck_time => "2013-06-27 19:00:00", :venue => @venue)
    gig.should be_invalid
    gig.should have(1).error_on(:doors_time)
  end

  it "should validate concert_start_time_okay" do
    gig = FactoryGirl.build(:gig, :doors_time => "2013-06-27 19:00:00", :concert_start_time => "2013-06-27 18:00:00", :venue => @venue)
    gig.should be_invalid
    gig.should have(1).error_on(:concert_start_time)
  end

  it "should validate concert_end_time_okay" do
    gig = FactoryGirl.build(:gig, :concert_end_time => "2013-06-27 19:00:00", :concert_start_time => "2013-06-27 20:00:00", :venue => @venue)
    gig.should be_invalid
    gig.should have(1).error_on(:concert_end_time)
  end

  it "should render correct attributes" do
    gig = FactoryGirl.create(:gig, :venue => @venue)
    
    gig.name.should               include "Concert"
    gig.description.should        include "Description"
    gig.soundcheck_time.should    eq "2013-06-27 18:00:00"
    gig.doors_time.should         eq "2013-06-27 19:30:00"
    gig.concert_start_time.should eq "2013-06-27 20:00:00"
    gig.concert_end_time.should   eq "2013-06-27 23:00:00"
    gig.venue_id.should           eq @venue.id
  end
end
