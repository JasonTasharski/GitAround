class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :activity_name
      t.text :description
      t.string :category
      t.string :lat
      t.string :lng
      t.string :location
      t.references :itinerary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
