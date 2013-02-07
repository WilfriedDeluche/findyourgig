class CreateBandParticipations < ActiveRecord::Migration
  def change
    create_table :band_participations do |t|
      t.integer :band_id
      t.integer :user_id
      t.date :date_joined
      t.date :date_left
      t.boolean :pending, default: true
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
