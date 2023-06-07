require 'rails_helper'

RSpec.describe "User New" do
  describe "User New" do
    it "has a form for new user to register" do
      visit new_user_path

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")
      expect(page).to have_button("Register User")
    end
  end
end