class ArtistService
  def self.artists(style)
    get_url("https://inklink-be-b5a197fb428f.herokuapp.com/api/v0/artists?style=#{style}")
  end

  def self.get_url(url)
    response = Faraday.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
