class AddFilesToKaruta < ActiveRecord::Migration[7.0]
  def change
    add_column :karuta, :audio, :string
    add_column :karuta, :image, :string
  end
end
