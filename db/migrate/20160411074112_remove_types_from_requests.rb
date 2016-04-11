class RemoveTypesFromRequests < ActiveRecord::Migration
  def change
  	remove_column :requests,:type
  end
end
