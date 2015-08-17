class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.string :cover

      t.timestamps null: false
    end
  end
end
