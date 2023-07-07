class TitlesController < ApplicationController
    def index
      @titles = Title.all
    end

    def show
      @title = Title.find(params[:id])
      @Karutas = Karutum.where(title_id: @title.id)
    end

    def new
      @title = Title.new
    end

    def create
      @title = Title.new(title_params)
        if @title.save
          redirect_to title_url(@title)
        else
          render :new
        end
    end

    def title_params
      params.require(:title).permit(:name)
    end
end
