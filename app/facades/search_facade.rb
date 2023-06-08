class SearchFacade
  
  def self.find_shops(city)
    SearchService.shops(city)[:data].map do |shop|
      Shop.new(shop)
    end
  end
end