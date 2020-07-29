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

  def photographs_by_artist 
    @artists.reduce(Hash.new {|h, k| h[k] = []}) do |result, artist| 
      @photographs.each do |photo|
      result[artist] << photo if photo.artist_id == artist.id
      end
      result
    end
  end
end