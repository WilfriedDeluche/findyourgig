require 'spec_helper'

describe "acts/show" do
  before(:each) do
    @act = assign(:act, stub_model(Act,
      :gig_id => 1,
      :band_id => 2,
      :is_main_act => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
