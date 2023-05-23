class AddSerialToBusLines < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_lines, :serial, :integer
  end
end
