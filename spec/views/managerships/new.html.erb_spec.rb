require 'spec_helper'

describe "managerships/new" do
  before(:each) do
    assign(:managership, stub_model(Managership,
      :is_admin => false
    ).as_new_record)
  end

  it "renders new managership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => managerships_path, :method => "post" do
      assert_select "input#managership_is_admin", :name => "managership[is_admin]"
    end
  end
end
