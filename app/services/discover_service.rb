class DiscoverService  
  def self.photos(style)
    get_url("?query=#{style}+tattoos") 
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    response = Faraday.new(url: 'https://inklink-be.herokuapp.com/api/v0/discover') do |faraday|
      faraday.params = { discover: params[:styles] }
    end
  end
end