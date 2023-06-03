require 'rails_helper'

RSpec.describe "User Dashboard Page" do
  describe "User Dashboard" do
    it "has an option for user to search for artist by style/location" do
      user = User.create!(name: "Angel Byun", username: "angelbyun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345", city: "Denver")

      visit user_path(user)

      expect(page).to have_content("Search")
    end
  end
end