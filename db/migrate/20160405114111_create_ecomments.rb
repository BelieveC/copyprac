class CreateEcomments < ActiveRecord::Migration
  def change
    create_table :ecomments do |t|
      t.integer :examnote_id
      t.text :body

      t.timestamps null: false
    end
    add_index :ecomments, :examnote_id
  end
end
