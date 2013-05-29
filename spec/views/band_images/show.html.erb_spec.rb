require 'spec_helper'

describe "band_images/show" do
  before(:each) do
    @band_image = assign(:band_image, stub_model(BandImage,
      :file => "File",
      :is_main => false,
      :band_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
    rendered.should match(/false/)
    rendered.should match(/1/)
  end
end
