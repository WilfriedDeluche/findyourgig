class FeedbackCommentsController < ApplicationController
	before_filter :find_venue
  before_filter :find_feedback


	def create
    @feedback_comment = @feedback.feedback_comments.build(params[:feedback_comment])
    @feedback_comment.user_id = current_user.id

    respond_to do |format|
      if @feedback_comment.save
        format.html { redirect_to venue_path(@venue), notice: t('feedback_comment_created') }
        format.js
      else
        format.html do
          flash[:error] = @feedback_comment
          redirect_to venue_path(@venue)
        end
        format.js { @errors = @feedback_comment.errors.to_a }
      end
    end
  end

  def destroy
    begin
    	@feedback_comment = @feedback.feedback_comments.find(params[:id])
      @feedback_comment.destroy
      
      respond_to do |format|
        format.html { redirect_to @venue, notice: t('feedback_comment_deleted') }
        format.js
      end
    rescue
      redirect_to @venue, alert: t('feedback_comment_unknown')
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

  def find_feedback
  	begin 
  		@feedback = Feedback.find(params[:feedback_id])
  	rescue
  		redirect_to venues_url, alert: t('feedback_unknown')
  	end
  end
end