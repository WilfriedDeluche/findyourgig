require 'spec_helper'

describe VenueImage do

  before :each do
    @user = FactoryGirl.create(:user, :role => "venue_manager")
    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save
  end

  after :each do
    @venue.destroy
  end

  it "has none to begin with" do
    VenueImage.count.should == 0
  end

  it "has one after adding one" do
    venue_image = FactoryGirl.build(:venue_image, :venue => @venue)
    venue_image.file = upload_file_for(venue_image)
    venue_image.save
    VenueImage.count.should == 1
  end

  it "has required fields missing" do
    venue_image = FactoryGirl.build(:venue_image, :venue => nil, :file => nil)

    venue_image.should be_invalid
    venue_image.should have(1).error_on(:file)
    venue_image.should have(1).error_on(:venue_id)
  end

  it "should render correct attributes" do
    venue_image = FactoryGirl.build(:venue_image, :venue => @venue, :is_main => true)
    venue_image.file = upload_file_for(venue_image)
    venue_image.save
    
    venue_image.venue.should eq @venue
    venue_image.is_main.should eq true
    venue_image.file_url.should include "/no-image.png"
  end

  it "should set default is_main" do
    venue_image = FactoryGirl.build(:venue_image, :venue => @venue)
    venue_image.file = upload_file_for(venue_image)
    venue_image.save

    venue_image.is_main.should eq true # Set as true when first image for venue

    venue_image_2 = FactoryGirl.build(:venue_image, :venue => @venue)
    venue_image_2.file = upload_file_for(venue_image_2)
    venue_image_2.save

    venue_image_2.is_main.should eq false # Set as false by default when not first image
  end


  it "should get previous and next venue_image" do
    venue_image = FactoryGirl.build(:venue_image, :venue => @venue)
    venue_image.file = upload_file_for(venue_image)
    venue_image.save

    venue_image_2 = FactoryGirl.build(:venue_image, :venue => @venue)
    venue_image_2.file = upload_file_for(venue_image_2)
    venue_image_2.save

    venue_image.previous.should eq venue_image_2
    venue_image_2.next.should eq venue_image
  end

  def upload_file_for(object)
    uploader = VenueImageUploader.new(object, :file)
    uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
    uploader
  end
end
