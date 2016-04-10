class AddExamnameSubjectDateTeacherToQpapers < ActiveRecord::Migration
  def change
    add_column :qpapers, :examname, :string
    add_column :qpapers, :subject, :string
    add_column :qpapers, :date, :datetime
    add_column :qpapers, :teacher, :string
  end
end
