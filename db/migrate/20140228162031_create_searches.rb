class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, index: true
      t.references :search_word, index: true

      t.timestamps
    end
  end
end
