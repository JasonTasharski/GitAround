class AddColumnToItinerary < ActiveRecord::Migration
  def change
  	add_column :itineraries, :parent_id, :integer
  end
end
