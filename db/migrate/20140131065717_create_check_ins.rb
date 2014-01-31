class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.references :check_out, index: true

      t.timestamps
    end
  end
end
