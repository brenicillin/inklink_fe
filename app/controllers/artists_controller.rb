class ArtistsController < ApplicationController

  def index
   @artists = ArtistFacade.find_artists(params[:style])
  end

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
        contact_info: params[:contact_info],
    }
    response = conn.post('artists', 'artist' => artist)
    require 'pry'; binding.pry
    redirect_to root_path
    end

  def show
    
  end
end