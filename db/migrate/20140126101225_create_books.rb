class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn, unique: true
      t.string :asin, unique: true
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :small_image
      t.string :medium_image
      t.string :large_image
      t.integer :price
      t.string :currency
      t.references :category, index: true

      t.timestamps
    end
  end
end
