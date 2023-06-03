require "rails_helper"

RSpec.describe "Logout Page" do
  describe "Logout Page" do
    it "creates a button to logout once a user has logged in successfully" do
      user = Users.create!(name: "Angel Byun", username: "angelbyun", email: "angelb12345@gmail.com", password: "12345", verify_password: "12345", city: "Denver")
      
      visit root_path

      click_button "Login"

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      
      click_button "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.name}!")
    end
  end
end