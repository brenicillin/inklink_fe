class ArtistService
  def self.artists(style)
    get_url("https://inklink-api-8fcb1eda69d6.herokuapp.com/api/v0/artists?style=#{style}")
  end

  def self.get_url(url)
    response = Faraday.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
