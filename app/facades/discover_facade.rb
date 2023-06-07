class DiscoverFacade
  def self.find_photos(style)
    photos = DiscoverService.list_photos(style)
    photos[:data].map do |photo|
      Photo.new(photo)
    end
  end
end