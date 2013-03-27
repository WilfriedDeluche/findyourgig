require 'spec_helper'

describe "gigs/new" do
  before(:each) do
    assign(:gig, stub_model(Gig,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new gig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gigs_path, :method => "post" do
      assert_select "input#gig_name", :name => "gig[name]"
      assert_select "textarea#gig_description", :name => "gig[description]"
    end
  end
end
