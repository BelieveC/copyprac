class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end
