class PlayersController < ApplicationController
    def entry
        @bus_lines = BusLine.all
        @player = Player.find(1)
        @player2 = Player.find(2)
        @player.update(situation: 1)
        @player2.update(situation: 1)
        redirect_to bus_lines_url
    end
end
