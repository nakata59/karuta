class BusSchedulesController < ApplicationController
  before_action :set_bus_schedule, only: %i[ show edit update destroy ]

  # GET /bus_schedules or /bus_schedules.json
  def index
    @bus_schedules = BusSchedule.all
  end

  # GET /bus_schedules/1 or /bus_schedules/1.json
  def show
  end

  # GET /bus_schedules/new
  def new
    @bus_schedule = BusSchedule.new
  end

  # GET /bus_schedules/1/edit
  def edit
  end

  # POST /bus_schedules or /bus_schedules.json
  def create
    @bus_schedule = BusSchedule.new(bus_schedule_params)

    respond_to do |format|
      if @bus_schedule.save
        format.html { redirect_to bus_schedule_url(@bus_schedule), notice: "Bus schedule was successfully created." }
        format.json { render :show, status: :created, location: @bus_schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bus_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_schedules/1 or /bus_schedules/1.json
  def update
    respond_to do |format|
      if @bus_schedule.update(bus_schedule_params)
        format.html { redirect_to bus_schedule_url(@bus_schedule), notice: "Bus schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @bus_schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bus_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_schedules/1 or /bus_schedules/1.json
  def destroy
    @bus_schedule.destroy

    respond_to do |format|
      format.html { redirect_to bus_schedules_url, notice: "Bus schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_schedule
      @bus_schedule = BusSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_schedule_params
      params.require(:bus_schedule).permit(:departure_hour, :departure_minute, :bus_line_id)
    end
end
