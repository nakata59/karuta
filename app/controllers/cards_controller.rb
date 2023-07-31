class CardsController < ApplicationController
    def new
      @card = Card.new
    end

    def show
      @card = Card.find(params[:id])
    end

    def create
    if params[:card][:audio_text] != ""
      api_key = ENV['IBM_KEY']
      text = params[:card][:audio_text]
      voice = "ja-JP_EmiVoice"
      output_file = "sample#{params[:card][:serial]}.mp3"
      url = "#{ENV['URL']}?voice=#{voice}"
      response = RestClient::Request.execute(
        method: :post,
        url: url,
        user: "apikey",
        password: api_key,
        payload: { text: text }.to_json,
        headers: { "Content-Type": "application/json", "Accept": "audio/mp3" }
      )
      File.open("public/#{output_file}", "wb") do |file|
        file.write(response)
      end
      
      @card = Card.new(serial: params[:card][:serial],title_id: params[:card][:title_id],image: params[:card][:image])
      @card.audio = File.open("public/#{output_file}")
      if @card.save
        redirect_to title_url(@card)
      else
        render :new
      end
    else
      @card = Card.new(serial: params[:card][:serial],title_id: params[:card][:title_id],image: params[:card][:image],audio: params[:card][:audio])
        if @card.save
          redirect_to title_url(@card)
        else
          render :new
        end
      end
    end

    def card_params
        params.require(:card).permit(:serial, :title_id, :image, :audio, :title_id, :audio_text)
    end
end
