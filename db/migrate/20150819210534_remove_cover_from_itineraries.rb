class RemoveCoverFromItineraries < ActiveRecord::Migration
  def change
  	remove_column :itineraries, :cover, :string
  end
end
