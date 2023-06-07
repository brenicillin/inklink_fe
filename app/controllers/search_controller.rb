class SearchController < ApplicationController
  def index
    @shops = SearchService.shops(params[:city])
  end
end