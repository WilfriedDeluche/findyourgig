class AddPosterToGig < ActiveRecord::Migration
  def change
    add_column :gigs, :poster, :string
  end
end
