class AddAttachmentPageToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :page
    end
  end

  def self.down
    remove_attachment :notes, :page
  end
end
