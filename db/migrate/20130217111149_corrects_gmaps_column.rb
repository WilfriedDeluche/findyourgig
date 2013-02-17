class CorrectsGmapsColumn < ActiveRecord::Migration
  def up
  	add_column :venues, :gmaps, :boolean
  end

  def down
  	remove_column :users, :gmaps, :boolean
  end
end
