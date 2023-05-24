class QuestionsController < ApplicationController
    def next
        @player = Player.find(1)
        @player2 = Player.find(2)
        if (@player.situation == "待機" && @player2.situation == "待機") or (@player.situation == "お手つき" && @player2.situation == "お手つき")
        @question = Question.first
        @next_line = BusLine.all.sample(1).first
        @a = @question.number
        @question.update(number: (@a + 1), serial: @next_line.serial)
        end
        redirect_to bus_lines_url
    end
end
