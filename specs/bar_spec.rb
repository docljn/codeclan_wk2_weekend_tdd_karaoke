
require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../bar.rb' )
require_relative( '../room.rb' )



class TestBar < MiniTest::Test

  def setup
    @room = Room.new("Blues")
    @bar = Bar.new("CCK", @room)

  end

  def test_bar_has_name
    assert_equal("CCK", @bar.name)
  end

  def test_bar_has_room
    assert_equal("Blues", @bar.room.name)
  end

  def test_bar_can_check_guest_into_room
    @bar.check_in("guest", @room)
    assert_equal(["guest"], @room.guest_list)
  end

  def test_bar_can_check_guest_out_of_room
    @bar.check_in("guest", @room)
    @bar.check_in("another guest", @room)
    @bar.check_out("guest", @room)
    assert_equal(["another guest"], @room.guest_list)
  end

  def test_bar_can_add_songlist
    @bar.add_song_list(@room, ["Hello", "Firework", "Sober"])
    assert_equal(["Hello", "Firework", "Sober"], @room.song_list)
  end

  def test_bar_can_clear_songlist
    @bar.add_song_list(@room, ["Hello", "Firework"])
    @bar.clear_song_list(@room)
    assert_equal([], @room.song_list)
  end



end
