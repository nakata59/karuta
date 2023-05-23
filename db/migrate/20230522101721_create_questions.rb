class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :serial
      t.integer :number

      t.timestamps
    end
  end
end
