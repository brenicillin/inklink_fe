class ArtistFacade
  
  def self.find_artists(style)
    ArtistService.artists(style).map do |artist|
      Artist.new(artist[1])
    end
  end
end