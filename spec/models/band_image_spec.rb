require 'spec_helper'

describe BandImage do
  
  before :each do
    @user = FactoryGirl.create(:user, :role => "band_member")
    @band = FactoryGirl.create(:band)
  end

  after :each do
    @band.destroy
  end

  it "has none to begin with" do
    BandImage.count.should == 0
  end

  it "has one after adding one" do
    band_image = FactoryGirl.build(:band_image, :band => @band)
    band_image.file = upload_file_for(band_image)
    band_image.save
    BandImage.count.should == 1
  end

  it "has required fields missing" do
    band_image = FactoryGirl.build(:band_image, :band => nil, :file => nil)

    band_image.should be_invalid
    band_image.should have(1).error_on(:file)
    band_image.should have(1).error_on(:band_id)
  end

  it "should render correct attributes" do
    band_image = FactoryGirl.build(:band_image, :band => @band, :is_main => true)
    band_image.file = upload_file_for(band_image)
    band_image.save
    
    band_image.band.should eq @band
    band_image.is_main.should eq true
    band_image.file_url.should include "/no-image.png"
  end

  it "should set default is_main" do
    band_image = FactoryGirl.build(:band_image, :band => @band)
    band_image.file = upload_file_for(band_image)
    band_image.save

    band_image.is_main.should eq true # Set as true when first image for band

    band_image_2 = FactoryGirl.build(:band_image, :band => @band)
    band_image_2.file = upload_file_for(band_image_2)
    band_image_2.save

    band_image_2.is_main.should eq false # Set as false by default when not first image
  end


  it "should get previous and next band_image" do
    band_image = FactoryGirl.build(:band_image, :band => @band)
    band_image.file = upload_file_for(band_image)
    band_image.save

    band_image_2 = FactoryGirl.build(:band_image, :band => @band)
    band_image_2.file = upload_file_for(band_image_2)
    band_image_2.save

    band_image.previous.should eq band_image_2
    band_image_2.next.should eq band_image
  end

  def upload_file_for(object)
    uploader = BandImageUploader.new(object, :file)
    uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
    uploader
  end
end
