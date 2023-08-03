class QuestionsController < ApplicationController
    def next
        @question = Question.find_by(room_id: params[:room_id])
        @next_line = BusLine.where(room_id: params[:room_id]).all.sample(1).first
        @a = @question.number
        @question.update(number: (@a + 1), serial: @next_line.serial)
        /questions/ === request.url
        redirect_to "#{$`}rooms/#{params[:room_id]}"
    end
end
