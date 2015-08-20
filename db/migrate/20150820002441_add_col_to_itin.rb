class AddColToItin < ActiveRecord::Migration
  def change
    add_column :itineraries, :parent, :integer
  end
end
