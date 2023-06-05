class DiscoverController < ApplicationController
  def index
    response = Faraday.new(url: 'https://inklink-be.herokuapp.com/api/v0/discover') do |faraday|
      faraday.params = { discover: params[:styles] }
    end
  end
end