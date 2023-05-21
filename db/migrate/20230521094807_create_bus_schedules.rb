class CreateBusSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_schedules do |t|
      t.integer :departure_hour
      t.integer :departure_minute
      t.integer :bus_line_id

      t.timestamps
    end
  end
end
