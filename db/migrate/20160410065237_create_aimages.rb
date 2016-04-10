class CreateAimages < ActiveRecord::Migration
  def change
    create_table :aimages do |t|
      t.integer :assignment_id

      t.timestamps null: false
    end
    add_index :aimages, :assignment_id
  end
end
