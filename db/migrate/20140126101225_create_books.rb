class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :small_image
      t.string :medium_image
      t.string :detail_page_url
      t.references :category, index: true

      t.timestamps
    end
  end
end
