class ListBusSchedulesController < ApplicationController
  def index
    sleep 2
    @bus_schedules = BusSchedule.all
  end
end