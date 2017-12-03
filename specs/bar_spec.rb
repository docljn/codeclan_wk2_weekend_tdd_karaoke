
require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../bar.rb' )
require_relative( '../room.rb' )
require_relative( '../guest.rb' )
require_relative( '../song.rb' )

require("pry")

class TestBar < MiniTest::Test

  def setup
    @firework = Song.new("Firework")
    @sober = Song.new("Sober")
    @guest = Guest.new({:name => "James", :money => 50, :favourite => "Firework"})
    @another_guest = Guest.new({:name => "Jim", :money => 50, :favourite => "Sober"})
    @room_with_guests = Room.new({:name => "Rock", :capacity => 2, :song_list =>[@sober, @firework], :guest_list => [@guest, @another_guest]})
    @room = Room.new({
    :name => "Blues",
    :capacity => 2})
    @bar = Bar.new("CCK", @room)



  end

  def test_bar_has_name
    assert_equal("CCK", @bar.name)
  end

  def test_bar_has_room
    assert_equal("Blues", @bar.room.name)
  end

  def test_bar_can_check_guest_into_room
    @bar.check_in(@guest, @room)
    assert_equal([@guest], @room.guest_list)
  end

  def test_bar_can_check_guest_out_of_room

    @bar.check_in(@guest, @room)
    @bar.check_in(@another_guest, @room)
    @bar.check_out(@guest, @room)
    assert_equal([@another_guest], @room.guest_list)
  end

  def test_bar_can_add_songlist
    @bar.add_song_list(@room, [@firework, @sober])
    assert_equal([@firework, @sober], @room.song_list)
  end

  def test_bar_can_reset_room__room_empty
    @bar.add_song_list(@room, [@firework, @sober])
    @bar.check_in(@guest, @room)
    @bar.check_out(@guest, @room)
    @bar.reset(@room)
    assert_equal([], @room.song_list)
    assert_equal([], @room.guest_list)
  end

  def test_bar_can_reset_room__room_occupied
    @bar.reset(@room_with_guests)
    assert_equal([@sober, @firework], @room_with_guests.song_list)
    assert_equal([@guest, @another_guest], @room_with_guests.guest_list)
  end

  def test_bar_can_charge_customer__sufficient_funds
    @bar.charge(@guest, 10)
    assert_equal(40, @guest.money)
  end

  def test_bar_can_charge_customer__insufficient_funds
    @bar.charge(@guest, 100)
    assert_equal(50, @guest.money)
  end

  def test_guest_cheers_on_checkin_if_favourite_on_list
    @room.upload(@firework)
    result = @bar.check_in(@guest, @room)
    assert_equal("Whoooo!", result)
  end

  




end
