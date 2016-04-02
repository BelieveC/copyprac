class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :topic
      t.string :reasearchers
      t.string :subject
      t.string :duration
      t.string :publisher
      t.text :description

      t.timestamps null: false
    end
  end
end
