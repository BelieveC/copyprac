class AddTipsToExamnotes < ActiveRecord::Migration
  def change
    add_column :examnotes, :tips, :text
  end
end
