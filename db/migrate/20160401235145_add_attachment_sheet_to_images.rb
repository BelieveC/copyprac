class AddAttachmentSheetToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :sheet
    end
  end

  def self.down
    remove_attachment :images, :sheet
  end
end
