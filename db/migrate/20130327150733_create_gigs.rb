class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.text :description
      t.datetime :soundcheck_time
      t.datetime :doors_time
      t.datetime :concert_start_time
      t.datetime :concert_end_time
      t.integer :venue_id

      t.timestamps
    end
  end
end
