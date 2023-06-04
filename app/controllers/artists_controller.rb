class ArtistsController < ApplicationController
  def new
  end

  def create
    conn = Faraday.new(url: "https://inklink-be.herokuapp.com/api/v0/")
    artist = {
        name: params[:name],
        email: params[:email],
        password: params[:password],
        confirm_password: params[:confirm_password],
        pricing: params[:pricing],
        styles: params[:styles],
    }
    response = conn.post('artists', 'artist' => artist)
    redirect_to root_path
    end

  def show
    
  end
end