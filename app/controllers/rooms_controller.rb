class RoomsController < ApplicationController
    def index
      @rooms = Room.all
    end
    def show
      @room = Room.find(params[:id]) 
      @bus_lines = BusLine.where(room_id:@room.id)
      @players = Player.where(room_id:@room.id).all
      @questions = Question.all
    end
    def new
      @room = Room.new
    end
    def create
      @room = Room.new
      @room.update(name:params[:room][:name])
      Player.create(name: current_user.name,room_id: @room.id,score: 0,situation: 0)
      
      if @room.save
        if params[:room][:kazu].to_i == 0
            @kazu = 20
          else
            @kazu = params[:room][:kazu].to_i
          end
          @karutas = Card.where(title_id: params[:room][:title_id].to_i).all.sample(@kazu)
          @karutas.each do |karuta|
            BusLine.create(serial:karuta.serial,image_url:karuta.image_url,audio_url:karuta.audio_url,title_id:params[:room][:title_id].to_i,room_id:@room.id)
          end
          Question.create(room_id: @room.id,number: 1,serial: BusLine.order(Arel.sql('RANDOM()')).limit(1).first.serial)
      end
    end
end
