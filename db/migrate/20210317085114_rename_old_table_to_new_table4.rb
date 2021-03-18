class RenameOldTableToNewTable4 < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :room, :rooms
  end

  def self.down
    rename_table :rooms, :room
  end

end
