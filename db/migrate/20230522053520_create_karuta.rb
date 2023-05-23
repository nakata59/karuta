class CreateKaruta < ActiveRecord::Migration[7.0]
  def change
    create_table :karuta do |t|
      t.integer :serial
      t.references :title, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
