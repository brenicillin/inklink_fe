class Shop
  attr_reader :name,
              :address

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
  end
end