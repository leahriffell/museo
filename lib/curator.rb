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
end