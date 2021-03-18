class RenameOldTableToNewTable3 < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :guest, :guests
  end

  def self.down
    rename_table :guests, :guest
  end
end
