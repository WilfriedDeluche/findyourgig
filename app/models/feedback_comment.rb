class FeedbackComment < ActiveRecord::Base
  belongs_to :feedback
  belongs_to :user

  attr_accessible :description, :feedback_id, :user_id

  validates_presence_of :description, :feedback_id, :user_id
end
