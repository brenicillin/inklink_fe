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
        styles: params[:styles]
      }
    response = conn.post('artists', 'artist' => artist)
    artist_user = User.create!(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:confirm_password], artist: true)
    redirect_to root_path
    end

  def show
    conn = Faraday.new(url: "https://inklink-be.herokuapp.com/api/v0/")
    @artist = ArtistFacade.find_artist(params[:email])
  end

  def edit
    @artist = ArtistFacade.find_artist(params[:email])
  end

  def update
    @artist = User.find_by(email: params[:email])
    conn = Faraday.new(url: "https://inklink-be.herokuapp.com/api/v0/artist")
    artist = {
      name: params[:name],
      email: params[:email],
      password: params[:password],
      confirm_password: params[:confirm_password],
      pricing: params[:pricing],
      styles: params[:styles]
    }
    response = conn.patch('artists', 'artist' => artist)
    if response.success?
      flash[:success] = "Your profile has been updated!"
      redirect_to artist_path(@artist)
    else
      flash[:error] = "Please fill out all fields."
      redirect_to edit_artist_path(@artist)
    end
  end
end