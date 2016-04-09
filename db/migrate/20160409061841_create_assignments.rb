class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :topic
      t.integer :subject_id
      t.integer :college_id

      t.timestamps null: false
    end
  end
end
