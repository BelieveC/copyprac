class CreateThesisimages < ActiveRecord::Migration
  def change
    create_table :thesisimages do |t|

      t.timestamps null: false
    end
  end
end
