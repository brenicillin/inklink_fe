class SearchService
  def self.shops(city)
    get_url("/api/v0/search?city=#{city}")
  end

  def self.get_url(url)
    response = conn.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://inklink-api-8fcb1eda69d6.herokuapp.com") do |faraday|
      faraday.headers = { 'CONTENT_TYPE' => 'application/json'}
    end
  end
end
