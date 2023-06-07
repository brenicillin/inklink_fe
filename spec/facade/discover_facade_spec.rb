require 'rails_helper'

RSpec.describe DiscoverFacade do
  before :each do
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/discover?discover=Chicano+tattoos")
    .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))
  end
  describe "class methods" do
    describe "#find_photos" do
      it "finds photos from a specific style" do
        photos = DiscoverFacade.find_photos("Chicano")

        expect(photos).to be_an(Array)

        photo_data = photos.first

        expect(photo_data).to be_a(Photo)
        expect(photo_data.thumbnail).to be_a(String)
        expect(photo_data.thumbnail).to eq("https://rapidapi.usearch.com/api/thumbnail/get?value=1701595348427531365")
        expect(photo_data.title).to be_a(String)
        expect(photo_data.title).to eq("American Traditional - Pipeburn")
      end
    end
  end
end