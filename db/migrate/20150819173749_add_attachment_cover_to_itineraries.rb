class AddAttachmentCoverToItineraries < ActiveRecord::Migration
  def self.up
    change_table :itineraries do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :itineraries, :cover
  end
end
