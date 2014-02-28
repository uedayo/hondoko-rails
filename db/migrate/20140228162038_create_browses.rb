class CreateBrowses < ActiveRecord::Migration
  def change
    create_table :browses do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.references :search, index: true

      t.timestamps
    end
  end
end
