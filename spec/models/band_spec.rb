require 'spec_helper'

describe Band do
  it "has none to begin with" do
    Band.count.should == 0
  end

  it "has one after adding one" do
    band = FactoryGirl.create(:band)
    Band.count.should == 1
  end

  it "has required fields missing" do
    band = FactoryGirl.build(:band, :name => "", :creation_year => "")
    band.should be_invalid
    band.should have(1).error_on(:name)
    band.should have(1).error_on(:creation_year)
  end

  it "should render correct attributes" do
    band = FactoryGirl.create(:band, :name => "Erase", :creation_year => 2008, :description => "My description", :city => "New York City")
    band.name.should eq "Erase"
    band.creation_year.should eq 2008
    band.city.should eq "New York City"
    band.description.should eq "My description"
  end
end
