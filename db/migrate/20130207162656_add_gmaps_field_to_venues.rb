class AddGmapsFieldToVenues < ActiveRecord::Migration
  def up
  	add_column :users, :gmaps, :boolean
  end
  
  def down
  end
end
