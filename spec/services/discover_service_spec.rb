require 'rails_helper'

RSpec.describe DiscoverService do
  before(:each) do
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/discover?query=geometric+tattoos")
     .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))
  end

  describe 'class methods' do
    it 'returns a JSON including photos' do
      response = DiscoverService.photos("geometric")
      expect(response).to be_a(Hash)
      expect(response[:value]).to be_an(Array)
      expect(response[:value][0]).to have_key(:thumbnail)
    end
  end
end