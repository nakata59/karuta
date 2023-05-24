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

    def entry
        @bus_lines = BusLine.all
        @player = Player.find(1)
        @player2 = Player.find(2)
        @player.update(situation: 1)
        @player2.update(situation: 1)
        redirect_to bus_lines_url
    end
end
