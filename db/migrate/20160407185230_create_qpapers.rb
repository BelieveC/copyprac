class CreateQpapers < ActiveRecord::Migration
  def change
    create_table :qpapers do |t|

      t.timestamps null: false
    end
  end
end
