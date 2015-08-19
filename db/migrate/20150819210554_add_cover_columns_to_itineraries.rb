class AddCoverColumnsToItineraries < ActiveRecord::Migration
  def up
    add_attachment :itineraries, :cover
  end

  def down
    remove_attachment :itineraries, :cover
  end
end
