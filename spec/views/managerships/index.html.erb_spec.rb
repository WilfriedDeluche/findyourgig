require 'spec_helper'

describe "managerships/index" do
  before(:each) do
    assign(:managerships, [
      stub_model(Managership,
        :is_admin => false
      ),
      stub_model(Managership,
        :is_admin => false
      )
    ])
  end

  it "renders a list of managerships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
