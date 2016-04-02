class AddPracticalIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :practical_id, :integer
    add_index :images, :practical_id
  end
end
