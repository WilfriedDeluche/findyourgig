class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :description
      t.integer :rating
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
