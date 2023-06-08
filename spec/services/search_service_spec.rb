require 'rails_helper'

RSpec.describe SearchService do
  before :each do
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/search?city=Tampa").
     to_return(status: 200, body: File.read("./spec/fixtures/search_service.json"))
    @user = User.create!(name: "Bob", email: "bob@bob.com", password: "1234", password_confirmation: "1234")
  end

  describe 'class methods' do
    it 'returns a JSON including shops for Tampa' do
      response = SearchService.shops("Tampa")

      shop = response[:data].first

      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data]).to be_an(Array)
      expect(shop[:type]).to eq("shop")
      expect(shop[:attributes]).to have_key(:name)
      expect(shop[:attributes]).to have_key(:address)
    end
  end
end