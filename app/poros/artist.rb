class Artist
  attr_reader :name,
              :styles,
              :email,
              :pricing

  def initialize(data)
    @name = data[:name]
    @email = data[:email]
    @pricing = data[:pricing]
    @styles = if data[:styles].class == Array
                data[:styles].join(", ")
              else
                data[:styles]
              end
  end
end