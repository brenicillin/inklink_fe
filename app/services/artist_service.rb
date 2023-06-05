class ArtistService

  def self.conn
    Faraday.new(url: "https://inklink-be.herokuapp.com/api/v0") do |f|
      f.params = {style = params[:style]}
    end
  end

  def self.get_url(url)
    response = conn.get
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.artists
    get_url("/artists")
  end
end