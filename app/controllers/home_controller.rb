class HomeController < ApplicationController
  def index
    @gigs = Gig.upcoming.includes([{:main_act => :band}, :venue]).limit(4)
    @nb_gigs = Gig.upcoming.count
    @venues = Venue.includes(:main_image).limit(4)
    @nb_venues = Venue.count
    @bands = Band.includes(:main_image).limit(4)
    @nb_bands = Band.count
  end

  def search
    unless params[:latitude].blank? || params[:longitude].blank?
      location = [params[:latitude].to_f,params[:longitude].to_f]
    else
      location = params[:formatted_address]
    end

    if params[:find_venues]
      if location
        @venues = Venue.unscoped.near(location, 200, order: :distance).limit(5)
      else
        @venues = []
      end
    else
      if location
        @venues_nearby = Venue.unscoped.near(location, 200, order: :distance)
        @gigs = Gig.where(:venue_id => @venues_nearby.collect(&:id)).upcoming.includes([{:main_act => :band}, :venue]).limit(10)
      else
        @gigs = []
      end
    end
  end
end
