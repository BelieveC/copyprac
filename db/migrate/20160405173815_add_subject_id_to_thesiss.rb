class AddSubjectIdToThesiss < ActiveRecord::Migration
  def change
    add_column :theses, :subject_id, :integer
  end
end
