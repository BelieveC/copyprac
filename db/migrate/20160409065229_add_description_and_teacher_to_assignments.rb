class AddDescriptionAndTeacherToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :description, :text
    add_column :assignments, :teacher, :string
  end
end
