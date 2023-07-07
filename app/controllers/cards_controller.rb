class CardsController < ApplicationController
    def new
      @card = Card.new
    end

    def show
      @card = Card.find(params[:id])
    end

    def create
      @card = Card.new(card_params)
        if @card.save
          redirect_to title_url(@card)
        else
          render :new
        end
    end

    def card_params
        params.require(:card).permit(:serial, :title_id, :image, :audio, :title_id)
    end
end
