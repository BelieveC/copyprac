class AddExamnoteIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :examnote_id, :integer
  end
end
