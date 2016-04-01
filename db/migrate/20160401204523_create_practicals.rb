class CreatePracticals < ActiveRecord::Migration
  def change
    create_table :practicals do |t|
      t.string :aim
      t.string :subject
      t.text :description

      t.timestamps null: false
    end
  end
end
