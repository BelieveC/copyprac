class AddAttachmentImageToQimages < ActiveRecord::Migration
  def self.up
    change_table :qimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :qimages, :image
  end
end
