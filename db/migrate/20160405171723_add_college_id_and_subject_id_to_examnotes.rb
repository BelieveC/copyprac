class AddCollegeIdAndSubjectIdToExamnotes < ActiveRecord::Migration
  def change
    add_column :examnotes, :college_id, :integer
    add_column :examnotes, :subject_id, :integer
  end
end
