class AddFilesToBusLines < ActiveRecord::Migration[7.0]
  def change
    add_column :bus_lines, :audio_url, :string
    add_column :bus_lines, :image_url, :string
  end
end
