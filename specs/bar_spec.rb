
require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../bar.rb' )
require_relative( '../room.rb' )
require_relative( '../guest.rb' )



class TestBar < MiniTest::Test

  def setup
    @room = Room.new("Blues", 2)
    @bar = Bar.new("CCK", @room)
    @guest = Guest.new("James", 50, "Wonderwall")

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

  def test_bar_can_reset_room__room_empty
    @bar.add_song_list(@room, ["Hello", "Firework"])
    @bar.check_in(@guest, @room)
    @bar.check_out(@guest, @room)
    @bar.reset(@room)
    assert_equal([], @room.song_list)
    assert_equal([], @room.guest_list)
  end

  def test_bar_can_reset_room__room_occupied
    @bar.add_song_list(@room, ["Hello", "Firework"])
    @bar.check_in(@guest, @room)
    @bar.reset(@room)
    assert_equal(["Hello", "Firework"], @room.song_list)
    assert_equal([@guest], @room.guest_list)
  end

  def test_bar_can_charge_customer__sufficient_funds
    @bar.charge(@guest, 10)
    assert_equal(40, @guest.money)
  end

  def test_bar_can_charge_customer__insufficient_funds
    @bar.charge(@guest, 100)
    assert_equal(50, @guest.money)
  end

  def test_customer_reacts_well_if_favourite_on_song_list
    skip
    assert_equal()
  end



end
