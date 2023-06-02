require 'rails_helper'

RSpec.describe "Artist New" do
  describe "Artist New" do
    it "has a form for new artist to register" do
      visit new_artist_path

      expect(page).to have_field("Name")
      expect(page).to have_field("Username")
      expect(page).to have_field("Password")
      expect(page).to have_field("Verify Password") 
      expect(page).to have_field("Pricing")
      expect(page).to have_field("Contact Info")
      expect(page).to have_button("Register Artist")
    end
  end
end