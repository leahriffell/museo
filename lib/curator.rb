require './lib/photograph'
require './lib/artist'
require './lib/file_io'
require 'pry'

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
end