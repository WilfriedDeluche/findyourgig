class FeedbackComments < ActiveRecord::Base
  attr_accessible :description, :feedback_id, :user_id
end
