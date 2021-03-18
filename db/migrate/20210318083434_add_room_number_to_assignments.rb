class AddRoomNumberToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :room_number, :string
  end
end
