class CreateFeedbackRatings < ActiveRecord::Migration
  def change
    create_table :feedback_ratings do |t|
      t.boolean :is_useful
      t.integer :feedback_id
      t.integer :user_id

      t.timestamps
    end
  end
end
