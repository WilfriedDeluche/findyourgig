require 'spec_helper'

describe "band_images/edit" do
  before(:each) do
    @band_image = assign(:band_image, stub_model(BandImage,
      :file => "MyString",
      :is_main => false,
      :band_id => 1
    ))
  end

  it "renders the edit band_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => band_images_path(@band_image), :method => "post" do
      assert_select "input#band_image_file", :name => "band_image[file]"
      assert_select "input#band_image_is_main", :name => "band_image[is_main]"
      assert_select "input#band_image_band_id", :name => "band_image[band_id]"
    end
  end
end
