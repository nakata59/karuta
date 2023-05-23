class BusLinesController < ApplicationController
  before_action :set_bus_line, only: %i[ show edit update destroy ]

  # GET /bus_lines or /bus_lines.json
  def index
    @bus_lines = BusLine.all
    @players = Player.all
    @questions = Question.all
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
    @karutas = Karutum.all
    @karutas.each do |karuta|
      BusLine.create(serial:karuta.serial)
      #respond_to do |format|
        #if @bus_line.save
          #format.html { redirect_to bus_line_url(@bus_line), notice: "Bus line was successfully created." }
          #format.json { render :show, status: :created, location: @bus_line }
       # else
          #format.html { render :new, status: :unprocessable_entity }
          #format.json { render json: @bus_line.errors, status: :unprocessable_entity }
        #end
      #end
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
    @player = Player.find(1)
    @player2 = Player.find(2)
   if @player.situation == "正常"
    @question = Question.first
    if @bus_line.serial == @question.serial
      @bus_line.destroy
      @player = Player.find(1)
      @player.update(score: @player.score += 1, situation: 0)
      @player2.update(situation: 0)
      Player.all.update(situation: 0)
      respond_to do |format|
        format.html { redirect_to bus_lines_url, notice: "Bus line was successfully destroyed." }
        format.json { head :no_content }
      end
    else
     p "お手隙"
     @player.update(situation: 2)
    end
   else
     p "まて"
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
    
    def entry
      @bus_lines = BusLine.all
      @player = Player.find(1)
      @player2 = Player.find(2)
      @player.update(situation: 1)
      @player2.update(situation: 1)
    end
end
