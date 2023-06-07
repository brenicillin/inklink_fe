require "rails_helper"

RSpec.describe "Logout Page" do
  describe "Logout Page" do
    it "creates a button to logout once a user has logged in successfully" do
      user = User.create!(name: "Angel Byun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345")
      
      visit root_path

      click_button "Login"

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      
      click_button "Submit"

      expect(current_path).to eq(user_path(user))

      visit root_path
      
      expect(page).to have_button("Logout")

      click_button "Logout"
      
      expect(current_path).to eq(root_path)
    end
  end
end