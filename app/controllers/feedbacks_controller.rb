class FeedbacksController < ApplicationController
	before_filter :find_venue

  def create
    @feedback = @venue.feedbacks.build(params[:feedback])
    @feedback.user_id = current_user.id

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to venue_path(@venue) }
        format.js
      else
        format.html do
          flash[:error] = @feedback
          redirect_to venue_path(@venue)
        end
        format.js { @errors = @feedback.errors.to_a }
      end
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