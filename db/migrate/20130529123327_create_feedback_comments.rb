class CreateFeedbackComments < ActiveRecord::Migration
  def change
    create_table :feedback_comments do |t|
      t.text :description
      t.integer :feedback_id
      t.integer :user_id

      t.timestamps
    end
  end
end
