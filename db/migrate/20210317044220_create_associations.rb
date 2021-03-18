class CreateAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :associations do |t|
      t.references :guests, null: false, foreign_key: true
      t.references :rooms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
