class RenameOldTableToNewTable < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :guests, :guest
  end

  def self.down
    rename_table :guest, :guests
  end
end
