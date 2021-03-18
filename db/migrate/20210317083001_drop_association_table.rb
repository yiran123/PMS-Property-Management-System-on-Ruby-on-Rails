class DropAssociationTable < ActiveRecord::Migration[6.1]
    def up
    drop_table :associations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
