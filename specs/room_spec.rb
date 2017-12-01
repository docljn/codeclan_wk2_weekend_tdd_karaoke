

require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../room.rb' )



class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Soul")
  end

  def test_room_has_name
    assert_equal("Soul", @room.name)
  end

  def test_room_has_place_to_store_songlist
    assert_equal([], @room.song_list)
  end

  def test_room_has_guest_list
    assert_equal([], @room.guest_list)
  end


end
