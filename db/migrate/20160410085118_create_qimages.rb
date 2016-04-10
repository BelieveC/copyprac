class CreateQimages < ActiveRecord::Migration
  def change
    create_table :qimages do |t|
      t.integer :qpaper_id

      t.timestamps null: false
    end
    add_index :qimages, :qpaper_id
  end
end
