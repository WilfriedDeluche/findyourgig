class CreateVenueImages < ActiveRecord::Migration
  def change
    create_table :venue_images do |t|
      t.integer :venue_id
      t.string :file
      t.boolean :is_main, default: true

      t.timestamps
    end
  end
end
