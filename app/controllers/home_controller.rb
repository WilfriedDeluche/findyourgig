class HomeController < ApplicationController
  def index
  end

  def search
    unless params[:latitude].blank? || params[:longitude].blank?
      location = [params[:latitude].to_f,params[:longitude].to_f]
    else
      location = params[:formatted_address]
    end

    if location
      @venues = Venue.unscoped.near(location, 200, order: :distance).limit(5).includes(:main_image)
    else
      @venues = []
    end
  end
end
