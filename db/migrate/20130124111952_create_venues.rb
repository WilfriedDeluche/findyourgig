class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :telephone
      t.string :email_address
      t.string :website
      
      t.timestamps
    end
  end
end
