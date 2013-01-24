require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :postalcode => "MyString",
      :city => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => venues_path, :method => "post" do
      assert_select "input#venue_name", :name => "venue[name]"
      assert_select "input#venue_address1", :name => "venue[address1]"
      assert_select "input#venue_address2", :name => "venue[address2]"
      assert_select "input#venue_postalcode", :name => "venue[postalcode]"
      assert_select "input#venue_city", :name => "venue[city]"
      assert_select "input#venue_country", :name => "venue[country]"
    end
  end
end
