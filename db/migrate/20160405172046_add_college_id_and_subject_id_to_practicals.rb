class AddCollegeIdAndSubjectIdToPracticals < ActiveRecord::Migration
  def change
    add_column :practicals, :college_id, :integer
    add_column :practicals, :subject_id, :integer
  end
end
