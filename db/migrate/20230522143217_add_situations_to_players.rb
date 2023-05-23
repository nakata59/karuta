class AddSituationsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :situation, :integer
  end
end
