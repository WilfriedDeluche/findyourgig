require 'carrierwave/test/matchers'

describe VenueImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @venue = FactoryGirl.create(:venue)
    @venue_image = @venue.venue_images.build(:is_main => false)

    VenueImageUploader.enable_processing = true
    @uploader = VenueImageUploader.new(@venue_image, :file)
    @uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
  end

  after do
    VenueImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 150 by 150 pixels" do
      @uploader.thumb.should have_dimensions(150, 150)
    end
  end

  context 'the normal version' do
    it "should scale down a landscape image to fit within 800 by 400 pixels" do
      @uploader.normal.should be_no_larger_than(800, 400)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644)
  end

  it "should have specific storing directory" do
    @uploader.store_dir.should eq("uploads/venues/#{@venue.id}/venue_images/#{@venue_image.id}")
  end

  it "should accepts specific extensions" do
    @uploader.extension_white_list.should include("jpg")
    @uploader.extension_white_list.should include("jpeg")
    @uploader.extension_white_list.should include("png")
    @uploader.extension_white_list.should include("gif")
    @uploader.extension_white_list.should_not include("doc")
    @uploader.extension_white_list.should_not include("xls")
    @uploader.extension_white_list.should_not include("pdf")
    @uploader.extension_white_list.should_not include("mp3")
    @uploader.extension_white_list.should_not include("mp4")
    @uploader.extension_white_list.should_not include("avi")
  end
end