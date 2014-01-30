class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.integer :operation
      t.date :due_date
      t.timestamps
    end
  end
end
