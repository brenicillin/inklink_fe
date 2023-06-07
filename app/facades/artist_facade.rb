class ArtistFacade
  
  def self.find_artists(style)
    artists = ArtistService.artists(style)
    artists[:data].map do |artist|
      Artist.new(artist)
    end
  end
end