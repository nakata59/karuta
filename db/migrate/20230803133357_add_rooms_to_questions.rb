class AddRoomsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :room, null: false, foreign_key: true
  end
end
