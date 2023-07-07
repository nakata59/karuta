class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :serial
      t.string :image
      t.string :audio
      t.integer :title_id

      t.timestamps
    end
  end
end
