class AddSlugToItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :slug, :string
    add_index :itineraries, :slug, unique: true
  end
end
