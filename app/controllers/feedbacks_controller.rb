class FeedbacksController < ApplicationController
	before_filter :find_venue

  def create
    @feedback = @venue.feedbacks.build(params[:feedback])
    @feedback.user_id = current_user.id

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to venue_path(@venue), notice: t('feedback_created') }
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
    begin
    	@feedback = @venue.feedbacks.find(params[:id])
      @feedback.destroy
      redirect_to @venue, notice: t('feedback_deleted')
    rescue
      redirect_to @venue, alert: t('feedback_unknown')
    end  
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