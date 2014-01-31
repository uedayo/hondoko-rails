class CreateCheckOuts < ActiveRecord::Migration
  def change
    create_table :check_outs do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.date :due_date

      t.timestamps
    end
  end
end
