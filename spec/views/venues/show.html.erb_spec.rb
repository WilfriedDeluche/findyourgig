require 'spec_helper'

describe "venues/show" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "Name",
      :address1 => "Address1",
      :address2 => "Address2",
      :postalcode => "Postalcode",
      :city => "City",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address1/)
    rendered.should match(/Address2/)
    rendered.should match(/Postalcode/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
  end
end
