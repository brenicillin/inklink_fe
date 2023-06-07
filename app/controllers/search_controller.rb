class SearchController < ApplicationController
  def index
    @shops = SearchFacade.find_shops(params[:city])
  end
end