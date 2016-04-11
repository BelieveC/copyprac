class RemoveTipsFromExamnotes < ActiveRecord::Migration
  def change
  	remove_column :examnotes, :tips
  end
end
