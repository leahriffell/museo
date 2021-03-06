require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'

class ArtistTest < Minitest::Test
  def setup 
    attributes = {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
    }
    @artist = Artist.new(attributes)
  end

  def test_it_exists_and_has_readable_attributes
    assert_instance_of Artist, @artist 
    assert_equal "2", @artist.id
    assert_equal "Ansel Adams", @artist.name 
    assert_equal "1902", @artist.born 
    assert_equal "1984", @artist.died 
    assert_equal "United States", @artist.country 
  end

  def test_it_can_return_artist_age_at_death 
    assert_equal 82, @artist.age_at_death
  end
end
