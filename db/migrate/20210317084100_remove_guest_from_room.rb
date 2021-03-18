class RemoveGuestFromRoom < ActiveRecord::Migration[6.1]
  def up
    remove_column :room, :guest
  end

  def down
    add_column :room, :guest, :string
  end
end
