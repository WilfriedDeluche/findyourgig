class FeedbacksController < ApplicationController
	before_filter :find_venue

  def create
    @feedback = @venue.feedbacks.create(params[:feedback])

    respond_to do |format|
      format.html { redirect_to venue_path(@venue) }
      format.js 
    end
  end

  def destroy
  	@feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to @venue
  end

  private
  def find_venue
  	begin 
  		@venue = Venue.find(params[:venue_id])
  	rescue
  		redirect_to venues_url, alert: t('venue_unknown')
  	end
  end
end