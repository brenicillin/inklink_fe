class Artist
  attr_reader :name,
              :styles,
              :email,
              :pricing

  def initialize(data)
    @name = data[0][:attributes][:name]
    @email = data[0][:attributes][:email]
    @pricing = data[0][:attributes][:pricing]
    @styles = if data[0][:attributes][:styles].class == Array
                data[0][:attributes][:styles].join(", ")
              else
                data[0][:attributes][:styles]
              end
  end
end