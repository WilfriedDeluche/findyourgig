require 'spec_helper'

describe "acts/new" do
  before(:each) do
    assign(:act, stub_model(Act,
      :gig_id => 1,
      :band_id => 1,
      :is_main_act => false
    ).as_new_record)
  end

  it "renders new act form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => acts_path, :method => "post" do
      assert_select "input#act_gig_id", :name => "act[gig_id]"
      assert_select "input#act_band_id", :name => "act[band_id]"
      assert_select "input#act_is_main_act", :name => "act[is_main_act]"
    end
  end
end
