require './lib/photograph'
require './lib/artist'
require './lib/file_io'

class Curator 
  attr_reader :photographs, :artists

  def initialize 
    @photographs = [] 
    @artists = [] 
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(artist_id)
    @artists.find {|artist| artist.id == artist_id}
  end

  def photographs_by_artist 
    @artists.reduce(Hash.new {|h, k| h[k] = []}) do |result, artist| 
      @photographs.each do |photo|
      result[artist] << photo if photo.artist_id == artist.id
      end
      result
    end
  end

  def artists_with_multiple_photographs 
    mult_photo_artists = photographs_by_artist.select do |artist, photo|
      photo.length > 1
    end.keys
    mult_photo_artists.map {|artist| artist.name}
  end

  def photographs_taken_by_artist_from(country) 
    photographs_by_artist.select do |artist, photo| 
      artist.country == country 
    end.values.flatten
  end 

  def load_photographs(data_path)
    all_photos = []
    CSV.foreach(data_path, headers: true, header_converters: :symbol) do |row|
      photo = Photograph.new(row.to_h)
      all_photos << photo
    end 
    all_photos
  end
end