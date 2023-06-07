class Artist
  attr_reader :name,
              :styles,
              :email,
              :pricing

  def initialize(data)
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @pricing = data[:attributes][:pricing]
    @styles = if data[:attributes][:styles].class == Array
                data[:attributes][:styles].join(", ")
              else
                data[:attributes][:styles]
              end
  end
end