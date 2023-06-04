require 'rails_helper'

RSpec.describe DiscoverService do
  before(:each) do
    require 'pry'; binding.pry
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/users/1/search&query=watercolor+tattoos")
     .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))
  end
  describe 'class methods' do
    it 'returns a JSON including photos' do
      response = DiscoverService.photos(params[:styles] = "watercolor")
      expect(response).to be_a(Hash)
      expect(response[:photos]).to be_an(Array)
      expect(response[:photos][0]).to be_a(Hash)

    end
  end
end