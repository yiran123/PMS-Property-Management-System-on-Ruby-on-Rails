class AddGuestToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :guest, :string
  end
end
