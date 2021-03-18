class RenameOldTableToNewTable2 < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :rooms, :room
  end

  def self.down
    rename_table :room, :rooms
  end
end
