class BusLinesController < ApplicationController
  before_action :set_bus_line, only: %i[ show edit update destroy ]

  # GET /bus_lines or /bus_lines.json
  def index
    @bus_lines = BusLine.all
  end

  # GET /bus_lines/1 or /bus_lines/1.json
  def show
  end

  # GET /bus_lines/new
  def new
    @bus_line = BusLine.new
  end

  # GET /bus_lines/1/edit
  def edit
  end

  # POST /bus_lines or /bus_lines.json
  def create
    @bus_line = BusLine.new(bus_line_params)

    respond_to do |format|
      if @bus_line.save
        format.html { redirect_to bus_line_url(@bus_line), notice: "Bus line was successfully created." }
        format.json { render :show, status: :created, location: @bus_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_lines/1 or /bus_lines/1.json
  def update
    respond_to do |format|
      if @bus_line.update(bus_line_params)
        format.html { redirect_to bus_line_url(@bus_line), notice: "Bus line was successfully updated." }
        format.json { render :show, status: :ok, location: @bus_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_lines/1 or /bus_lines/1.json
  def destroy
    @bus_line.destroy

    respond_to do |format|
      format.html { redirect_to bus_lines_url, notice: "Bus line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_line
      @bus_line = BusLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_line_params
      params.require(:bus_line).permit(:name)
    end
end
