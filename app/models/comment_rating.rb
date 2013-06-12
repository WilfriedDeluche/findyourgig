class CommentRating < ActiveRecord::Base
  belongs_to :feedback_comment
  belongs_to :user

  attr_accessible :is_useful, :feedback_comment_id, :user_id

  validates_presence_of :is_useful, :feedback_comment_id, :user_id
  validates_uniqueness_of :user_id, scope: :feedback_comment_id
end
