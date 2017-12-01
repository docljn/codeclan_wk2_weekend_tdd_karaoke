

require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../song.rb' )



class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Downtown")
  end

  def test_song_has_name
    assert_equal("Downtown", @song.name)
  end


end
