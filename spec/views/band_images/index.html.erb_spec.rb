require 'spec_helper'

describe "band_images/index" do
  before(:each) do
    assign(:band_images, [
      stub_model(BandImage,
        :file => "File",
        :is_main => false,
        :band_id => 1
      ),
      stub_model(BandImage,
        :file => "File",
        :is_main => false,
        :band_id => 1
      )
    ])
  end

  it "renders a list of band_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
