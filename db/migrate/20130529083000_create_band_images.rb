class CreateBandImages < ActiveRecord::Migration
  def change
    create_table :band_images do |t|
      t.string :file
      t.boolean :is_main, default: false
      t.integer :band_id

      t.timestamps
    end
  end
end
