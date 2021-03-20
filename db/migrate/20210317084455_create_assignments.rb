class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :guest, null: false, foreign_key: { to_table: :guests }
      t.references :room, null: false, foreign_key: { to_table: :rooms }

      t.timestamps
    end
  end
end
