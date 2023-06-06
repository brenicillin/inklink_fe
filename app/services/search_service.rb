class SearchService
  def self.shops(city)
    get_url("https://inklink-be.herokuapp.com/api/v0/search?query=#{city}")
  end

  def self.get_url(url)
    response = Faraday.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end