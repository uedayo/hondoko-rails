class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :last_name_hiragana
      t.string :first_name_hiragana
      t.string :last_name_roman
      t.string :first_name_roman
      t.string :email
      t.string :image_url
      t.references :division, index: true

      t.timestamps
    end
  end
end
