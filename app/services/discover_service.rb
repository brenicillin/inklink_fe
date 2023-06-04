class DiscoverService 
  def self.conn
    Faraday.new(url: "https://inklink-be.herokuapp.com/api/v0/users/#{params[:user_id]}/search}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.photos
    get_url("&query=#{params[:styles]} + tattoos")
  end
end