class AddSubjectIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :subject_id, :integer
  end
end
