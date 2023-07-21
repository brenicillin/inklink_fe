class DiscoverService  
  def self.list_photos(style)
    get_url("/api/v0/discover?discover=#{style}+tattoos")
  end
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://inklink-be.com") do |faraday|
      faraday.headers = { 'CONTENT_TYPE' => 'application/json' }
    end
  end
end
