class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postalcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
