class AddTypeIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :type_id, :integer
  end
end
