class PlayersController < ApplicationController
    def index
     @player = Player.find(1)
     @player2 = Player.find(2)
    end

    def first_join
      @player = Player.find(1)
      @player.update(name: current_user.name,score: 0,situation: 0)
      redirect_to bus_lines_url
    end

    def second_join
      @player2 = Player.find(2)
      @player2.update(name: current_user.name,score: 0,situation: 0)
      redirect_to bus_lines_url
    end

    def join
      Player.create(name: current_user.name,room_id: params[:room_id],score: 0,situation: 0)
      /players/ === request.url
      redirect_to "#{$`}rooms/#{params[:room_id]}"
    end

    def entry
        @bus_lines = BusLine.all
        Player.where(room_id:params[:room_id]).update(situation:1)
        /players/ === request.url
        redirect_to "#{$`}rooms/#{params[:room_id]}"
    end
end
