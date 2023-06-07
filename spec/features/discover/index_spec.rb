require 'rails_helper'

RSpec.describe 'Discover Tattoos Index' do
  before :each do
    @user = User.create!(name: "Angel Byun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345")
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/discover?discover=Watercolor+tattoos")
    .to_return(status: 200, body: File.read("./spec/fixtures/discover_service.json"))
  end

  describe 'As a User' do
    it "displays photos from a specific style of tattoo" do
      visit user_path(@user)

      select "Watercolor", from: :discover
      click_button "Discover Tattoos"

      expect(current_path).to eq(user_discover_index_path(@user))
      expect(page).to have_css("img[src*='']")
    end
  end
end