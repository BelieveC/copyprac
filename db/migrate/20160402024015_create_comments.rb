class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :practical_id
      t.text :body

      t.timestamps null: false
    end
    add_index :comments, :practical_id
  end
end
