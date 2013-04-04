class CreateManagerships < ActiveRecord::Migration
  def change
    create_table :managerships do |t|
      t.integer :venue_id
      t.integer :user_id
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
