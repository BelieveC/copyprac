class AddThesisIdToThesisimages < ActiveRecord::Migration
  def change
    add_column :thesisimages, :thesis_id, :integer
    add_index :thesisimages, :thesis_id
  end
end
