class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :description
      t.integer :creation_year
      t.string :city

      t.timestamps
    end
  end
end
