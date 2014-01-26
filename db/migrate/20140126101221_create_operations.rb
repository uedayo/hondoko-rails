class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.integer :operation

      t.timestamps
    end
  end
end
