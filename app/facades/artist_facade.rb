class ArtistFacade
  
  def self.find_artists
    ArtistService.artists.map do |artist|
      Artist.new(artist)
    end
  end
end