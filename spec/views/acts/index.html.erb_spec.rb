require 'spec_helper'

describe "acts/index" do
  before(:each) do
    assign(:acts, [
      stub_model(Act,
        :gig_id => 1,
        :band_id => 2,
        :is_main_act => false
      ),
      stub_model(Act,
        :gig_id => 1,
        :band_id => 2,
        :is_main_act => false
      )
    ])
  end

  it "renders a list of acts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
