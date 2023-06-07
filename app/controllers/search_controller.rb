class SearchController < ApplicationController
  def index
    @photos = SearchService.shops(params[:city])
  end
end