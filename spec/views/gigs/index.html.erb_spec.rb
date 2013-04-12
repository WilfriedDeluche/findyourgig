require 'spec_helper'

# describe "gigs/index" do
#   before(:each) do
#     assign(:gigs, [
#       stub_model(Gig,
#       :name => "Gig Name",
#       :description => "Gig Description",
#       :venue_id => "1", #Venue.all.collect{ |venue| venue.id }.sample,
#       :doors_time => "2013-04-02 19:30:00",
#       :concert_start_time => "2013-04-02 20:00:00"
#       ),
#       stub_model(Gig,
#       :name => "Gig Name",
#       :description => "Gig Description",
#       :venue_id => "1", #Venue.all.collect{ |venue| venue.id }.sample,
#       :doors_time => "2013-04-02 19:30:00",
#       :concert_start_time => "2013-04-02 20:00:00"
#       )
#     ])
#   end

#   it "renders a list of gigs" do
#     render
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "tr>td", :text => "Gig Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Gig Description".to_s, :count => 2
#   end
# end
