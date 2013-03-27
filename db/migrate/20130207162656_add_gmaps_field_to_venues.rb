class AddGmapsFieldToVenues < ActiveRecord::Migration
  def up
  	add_column :venues, :gmaps, :boolean
  end
  
  def down
  	remove_column :venues, :gmaps
  end
end
