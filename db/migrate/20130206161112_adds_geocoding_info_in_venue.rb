class AddsGeocodingInfoInVenue < ActiveRecord::Migration
  def up
		add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
  end

  def down
  end
end
