require 'rails_helper'

RSpec.describe 'Search Index Page' do
  before(:each) do
    stub_request(:get, "https://inklink-be.herokuapp.com/api/v0/search?city=Tampa").
     to_return(status: 200, body: File.read("./spec/fixtures/search_service.json"))
  @user = User.create!(name: "Bob", email: "bob@bob.com", password: "1234", password_confirmation: "1234")
  end

  describe 'As a User' do
    it 'I can log in and see a form to search for shops by city' do
      visit '/login'
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Submit"

      expect(current_path).to eq(user_path(@user))
      expect(page).to have_field(:city)
      expect(page).to have_button("Search by City")
    end

    it 'When I search for a city, I see a list of shops in that city' do
      visit user_path(@user)

      fill_in :city, with: "Tampa"
      click_button "Search by City"
      expect(current_path).to eq(user_search_index_path(@user))

      expect(page).to have_content("Tattoo Shops In Tampa")
      expect(page).to have_content("Bay City Tattoo")
      expect(page).to have_content("1632 E 7th Ave (at 17th St), Tampa, FL 33605")
      expect(page).to have_content("Las Vegas Tattoo Co.")
      expect(page).to have_content("1829 E 7th Ave, Tampa, FL 33605")
    end
  end
end