require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }

    it 'validates the validations' do
      user = User.create!(name: "Angel Byun", username: "angelbyun", email: "angelb12345@gmail.com", password: "12345", password_confirmation: "12345", city: "Denver")
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("12345")
    end
  end
end
