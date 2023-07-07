class KarutasController < ApplicationController
    def new; end

    def create
      @karutum = Karutum.new(karutum_params)
    
      if @karutum.save
        redirect_to titles_path
      else
        render :new
      end
    end

    private

    def karutum_params
      params.require(:karutum).permit(:serial, :audio, :image, :title_id)
    end
end
