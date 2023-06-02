require 'rails_helper'

RSpec.describe "Login Page" do
  describe "As a visitor" do
    it "I see a form to login" do
      visit "/"

      click_button "Login"
      save_and_open_page
      expect(current_path).to eq("/login")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_button("Login")

      #expect(page).to have_button("Login with Google") #COMING SOON (hopefully)
    end
  end
end