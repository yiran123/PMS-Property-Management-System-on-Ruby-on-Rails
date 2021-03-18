class AddRoomNumToGuest < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :roomNum, :string
  end
end
