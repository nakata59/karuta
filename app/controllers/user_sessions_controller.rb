class UserSessionsController < ApplicationController
    def new; end

    def create
      @user = login(params[:email], params[:password])
      if @user
        p "ログイン成功"
        redirect_to players_url
      else
        p "ログイン失敗"
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to bus_lines_url
    end
end
