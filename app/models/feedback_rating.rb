class FeedbackRating < ActiveRecord::Base
  belongs_to :feedback
  belongs_to :user

  attr_accessible :is_useful, :feedback_id, :user_id

  validates_presence_of :is_useful, :feedback_id, :user_id
end
