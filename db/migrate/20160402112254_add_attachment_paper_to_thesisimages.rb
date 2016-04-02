class AddAttachmentPaperToThesisimages < ActiveRecord::Migration
  def self.up
    change_table :thesisimages do |t|
      t.attachment :paper
    end
  end

  def self.down
    remove_attachment :thesisimages, :paper
  end
end
