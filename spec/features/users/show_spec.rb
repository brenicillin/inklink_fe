require 'rails_helper'

RSpec.describe "User Dashboard Page" do
  describe "User Dashboard" do
    it "has an option for user to search for artist by style/location" do
      user = User.create!(name: "Angel Byun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345", city: "Denver")

      visit user_path(user)

      expect(page).to have_content("Search")
    end
    
    it 'I see a section to discover tattoos' do
      user = User.create!(name: "Bob", email: "bob@bob.com", password: "password", password_confirmation: "password", city: "Denver")

      visit '/login'

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      
      click_button 'Submit'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_button('Search')
      expect(page).to have_selector(:link_or_button, 'Search')
    end
  end
end