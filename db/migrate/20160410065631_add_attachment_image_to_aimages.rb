class AddAttachmentImageToAimages < ActiveRecord::Migration
  def self.up
    change_table :aimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :aimages, :image
  end
end
