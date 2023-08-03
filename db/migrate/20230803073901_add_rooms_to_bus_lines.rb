class AddRoomsToBusLines < ActiveRecord::Migration[7.0]
  def change
    add_reference :bus_lines, :room, null: false, foreign_key: true
  end
end
