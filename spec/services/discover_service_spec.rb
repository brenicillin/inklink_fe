require 'rails_helper'

RSpec.describe DiscoverService do
  describe 'class methods' do
    it 'returns a JSON including photos for geometric' do
      stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/discover?discover=geometric+tattoos")
      .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))

      photos = DiscoverService.list_photos("geometric")
      
      expect(photos).to be_a(Hash)
      expect(photos).to have_key(:data)

      photo_data = photos[:data].first

      expect(photo_data).to have_key(:id)
      expect(photo_data[:id]).to eq(nil)
      expect(photo_data[:attributes]).to have_key(:thumbnail)
      expect(photo_data[:attributes][:thumbnail]).to be_a(String)
    end

    it 'returns a JSON including photos for tribal' do
      stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/discover?discover=tribal+tattoos")
      .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))

      photos = DiscoverService.list_photos("tribal")
      
      expect(photos).to be_a(Hash)
      expect(photos).to have_key(:data)

      photo_data = photos[:data].first

      expect(photo_data).to have_key(:id)
      expect(photo_data[:id]).to eq(nil)
      expect(photo_data[:attributes]).to have_key(:thumbnail)
      expect(photo_data[:attributes][:thumbnail]).to be_a(String)
    end
  end
end