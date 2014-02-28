class CreateSearchWords < ActiveRecord::Migration
  def change
    create_table :search_words do |t|
      t.references :user, index: true
      t.string :word

      t.timestamps
    end
  end
end
