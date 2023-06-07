require 'rails_helper'

RSpec.describe SearchFacade do
  before(:each) do
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/search?city=Tampa").
     to_return(status: 200, body: File.read("./spec/fixtures/search_service.json"))
  end

  describe 'class methods' do
    it 'Creates shop objects' do
      shops = SearchFacade.find_shops("Tampa")
      shop = shops.first

      expect(shops).to be_an(Array)
      expect(shop).to be_a(Shop)
      expect(shop.name).to eq("Bay City Tattoo")
      expect(shop.address).to eq("1632 E 7th Ave (at 17th St), Tampa, FL 33605")
    end
  end
end