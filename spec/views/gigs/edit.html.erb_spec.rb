require 'spec_helper'

describe "gigs/edit" do
  before(:each) do
    @gig = assign(:gig, stub_model(Gig,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit gig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gigs_path(@gig), :method => "post" do
      assert_select "input#gig_name", :name => "gig[name]"
      assert_select "textarea#gig_description", :name => "gig[description]"
    end
  end
end
