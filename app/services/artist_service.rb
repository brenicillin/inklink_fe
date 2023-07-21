class ArtistService
  def self.artists(style)
    get_url("http://inklink-be.com/api/v0/artists?style=#{style}")
  end

  def self.get_url(url)
    response = Faraday.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
