class AddsGeocodingInfoInVenue < ActiveRecord::Migration
  def up
		add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float

    add_index :venues, [:latitude, :longitude]
  end

  def down
    remove_column :venues, :latitude
    remove_column :venues, :longitude
  end
end
