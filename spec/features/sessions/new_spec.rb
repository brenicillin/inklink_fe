require 'rails_helper'

RSpec.describe "Login Page" do
  describe "As a visitor" do
    it "I see a form to login" do
      visit "/"

      click_button "Login"
     
      expect(current_path).to eq("/login")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_button("Submit")

      #expect(page).to have_button("Login with Google") #COMING SOON (hopefully)
    end

    it "existing user can fill in login form with information" do
      user = User.create!(name: "Angel Byun", username: "angelbyun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345", city: "Denver")

      visit root_path
      
      click_button "Login"

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_button "Submit"
      
      expect(page).to have_content("Welcome, #{user.name}!")
      expect(current_path).to eq(user_path(user))
    end
  end
end