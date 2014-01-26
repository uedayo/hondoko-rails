class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :book, index: true
      t.integer :volume
      t.references :area, index: true

      t.timestamps
    end
  end
end
