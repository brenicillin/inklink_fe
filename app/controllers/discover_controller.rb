class DiscoverController < ApplicationController
  def index
    @facade = DiscoverFacade.find_photos(params[:discover])
  end
end