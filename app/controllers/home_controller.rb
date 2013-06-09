class HomeController < ApplicationController
  def index
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
