require 'rails_helper'

RSpec.describe Artist do
  describe '#initialize' do
    it 'exists with attributes' do
      data_hash = {
        name: "Bob",
        email: "bob@bob.com",
        pricing: "$$$",
        styles: ["American Traditional, Geometric"]
      }
      
      bob = Artist.new(data_hash)
      
      expect(bob).to be_a(Artist)
      expect(bob.name).to eq("Bob")
      expect(bob.email).to eq("bob@bob.com")
      expect(bob.pricing).to eq("$$$")
      expect(bob.styles).to eq("American Traditional, Geometric")
    end
  end
end