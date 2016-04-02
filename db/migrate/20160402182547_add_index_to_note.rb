class AddIndexToNote < ActiveRecord::Migration
  def change
  	add_index :notes,:examnote_id
  end
end
