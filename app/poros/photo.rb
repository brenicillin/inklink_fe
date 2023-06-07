class Photo
  attr_reader :title,
              :thumbnail

  def initialize(photo_data)
    @title = photo_data[:attributes][:title]
    @thumbnail = photo_data[:attributes][:thumbnail]
  end
end