class FeedbacksController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @feedback = @venue.feedbacks.create(params[:feedback])

    respond_to do |format|
        format.html { redirect_to venue_path(@venue) }
        format.js 
    end
  end
end