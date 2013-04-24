require 'spec_helper'

# describe "gigs/edit" do
#   before(:each) do
#     @gig = assign(:gig, stub_model(Gig,
#       :name => "Gig Name",
#       :description => "Gig Description",
#       :venue_id => "1", #Venue.all.collect{ |venue| venue.id }.sample,
#       :doors_time => "2013-04-02 19:30:00",
#       :concert_start_time => "2013-04-02 20:00:00"
#     ))
#   end

#   it "renders the edit gig form" do
#     render

#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "form", :action => gigs_path(@gig), :method => "post" do
#       assert_select "input#gig_name", :name => "gig[name]"
#       assert_select "textarea#gig_description", :name => "gig[description]"
#     end
#   end
# end
