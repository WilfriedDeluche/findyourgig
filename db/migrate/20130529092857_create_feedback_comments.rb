class CreateFeedbackComments < ActiveRecord::Migration
  def change
    create_table :feedback_comments do |t|
      t.text :description
      t.text :feedback_id
      t.text :user_id

      t.timestamps
    end
  end
end
