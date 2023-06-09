class ArtistFacade
  
  def self.find_artists(style)
    artists = ArtistService.artists(style)
    artists[:data].map do |artist|
      Artist.new(artist)
    end
  end

  def self.find_artist(email)
    artist = ArtistService.artist(email)
    require 'pry'; binding.pry
    Artist.new(artist)
  end
end