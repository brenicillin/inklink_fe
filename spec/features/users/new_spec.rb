require 'rails_helper'

RSpec.describe "User New" do
  describe "User New" do
    it "has a form for new user to register" do
      visit new_user_path

      expect(page).to have_field("Name")
      expect(page).to have_field("Username")
      expect(page).to have_field("Password")
      expect(page).to have_field("Verify Password") 
      expect(page).to have_field("City")
      expect(page).to have_button("Register User")
    end
  end
end