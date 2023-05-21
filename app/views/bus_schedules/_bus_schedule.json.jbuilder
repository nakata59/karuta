json.extract! bus_schedule, :id, :departure_hour, :departure_minute, :bus_line_id, :created_at, :updated_at
json.url bus_schedule_url(bus_schedule, format: :json)
