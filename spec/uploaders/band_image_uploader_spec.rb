require 'carrierwave/test/matchers'

describe BandImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @band = FactoryGirl.create(:band)
    @band_image = @band.band_images.build(:is_main => false)

    BandImageUploader.enable_processing = true
    @uploader = BandImageUploader.new(@band_image, :file)
    @uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
  end

  after do
    BandImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 180 by 180 pixels" do
      @uploader.thumb.should have_dimensions(180, 180)
    end
  end

  context 'the normal version' do
    it "should scale down a landscape image to fit within 800 by 400 pixels" do
      @uploader.normal.should be_no_larger_than(800, 400)
    end
  end

  context 'the header version' do
    it "should scale down a landscape image to be exactly 830 by 450 pixels" do
      @uploader.header.should have_dimensions(830, 450)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644)
  end

  it "should have specific storing directory" do
    @uploader.store_dir.should eq("uploads/bands/#{@band.id}/images/#{@band_image.id}")
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