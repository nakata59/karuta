class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.text :name
      t.integer :score

      t.timestamps
    end
  end
end
