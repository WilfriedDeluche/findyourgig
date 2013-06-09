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

  it "should render upcoming gigs" do
    gig = FactoryGirl.create(:gig, :doors_time => (DateTime.now - 3.days), 
                                    :soundcheck_time => (DateTime.now - 3.days - 1.hours), 
                                    :concert_start_time => (DateTime.now - 3.days + 1.hours), 
                                    :concert_end_time => (DateTime.now - 3.days + 3.hours), :venue => @venue)

    gig_2 = FactoryGirl.create(:gig, :doors_time => (DateTime.now), 
                                    :soundcheck_time => (DateTime.now - 1.hours), 
                                    :concert_start_time => (DateTime.now + 1.hours), 
                                    :concert_end_time => (DateTime.now + 3.hours), :venue => @venue)

    gig_3 = FactoryGirl.create(:gig, :doors_time => (DateTime.now + 3.days), 
                                    :soundcheck_time => (DateTime.now + 3.days - 1.hours), 
                                    :concert_start_time => (DateTime.now + 3.days + 1.hours), 
                                    :concert_end_time => (DateTime.now + 3.days + 3.hours), :venue => @venue)

    gigs = Gig.upcoming
    gigs.size.should eq 2
    gigs.should include gig_2
    gigs.should include gig_3
    gigs.should_not include gig
  end
end
