class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.integer :gig_id
      t.integer :band_id
      t.boolean :is_main_act, default: false

      t.timestamps
    end
  end
end
