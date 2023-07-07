class AddTitleToBusLines < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_lines, :title_id, :integer
  end
end
