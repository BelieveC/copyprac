class CreateExamnotes < ActiveRecord::Migration
  def change
    create_table :examnotes do |t|
      t.string :subject
      t.string :topic
      t.string :tips

      t.timestamps null: false
    end
  end
end
