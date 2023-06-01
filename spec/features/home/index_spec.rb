require 'rails_helper'

RSpec.describe "Home Index" do
  describe "Home Index" do
    it "has a button to register User/Artist" do
      visit root_path

      expect(page).to have_button("Artist Register")
      expect(page).to have_button("User Register")
    end

    it "artist register takes me to new_artist_path" do
      visit root_path

      click_button "Artist Register"

      expect(current_path).to eq(new_artist_path)
    end

    it "user register takes me to new_user_path" do
      visit root_path

      click_button "User Register"

      expect(current_path).to eq(new_user_path)
    end
  end
end