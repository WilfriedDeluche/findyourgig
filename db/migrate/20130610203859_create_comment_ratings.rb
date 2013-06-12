class CreateCommentRatings < ActiveRecord::Migration
  def change
    create_table :comment_ratings do |t|
      t.boolean :is_useful
		  t.integer :feedback_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
