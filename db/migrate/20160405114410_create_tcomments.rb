class CreateTcomments < ActiveRecord::Migration
  def change
    create_table :tcomments do |t|
      t.integer :thesis_id
      t.text :body

      t.timestamps null: false
    end
    add_index :tcomments, :thesis_id
  end
end
