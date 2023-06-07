class SearchFacade
  
  def self.find_shops(city)
    SearchService.shops(city).map do |shop|
      Shop.new(shop[1])
    end
  end
end