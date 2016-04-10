class AddCollegeIdAndSubjectIdToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :college_id, :integer
    add_column :qpapers, :subject_id, :integer
  end
end
