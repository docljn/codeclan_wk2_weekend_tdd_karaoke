

require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../room.rb' )
require_relative( '../song.rb' )
require_relative( '../guest.rb'  )



class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(
      :name => "Soul",
      :capacity => 2
    )
    @song = Song.new("Macarena")
    @another_song = Song.new("Hello")
    @guest = Guest.new({:name => "Jack", :money => 100, :favourite => "Macarena"})
    @another_guest = Guest.new({:name => "Jim", :money => 10, :favourite => "Mud"})
  end

  def test_room_has_name
    assert_equal("Soul", @room.name)
  end

  def test_room_has_capacity
    assert_equal(2, @room.capacity)
  end

  def test_room_has_place_to_store_songlist
    assert_equal([], @room.song_list)
  end

  def test_room_has_guest_list
    assert_equal([], @room.guest_list)
  end

  def test_guest_can_enter_room__room_has_space
    @room.enter(@guest)
    assert_equal([@guest], @room.guest_list )
  end

  def test_guest_cannot_enter_room__room_full
    @room.enter("guest")
    @room.enter("another guest")
    @room.enter("a third guest")
    assert_equal(["guest", "another guest"], @room.guest_list )
  end

  def test_guest_can_leave_room
    @room.enter("guest")
    @room.enter("another_guest")
    @room.leave("guest")
    assert_equal(["another_guest"], @room.guest_list )
  end

  def test_room_can_upload_songs
    @room.upload(@song)
    assert_equal([@song], @room.song_list)
  end

  def test_room_can_remove_songs
    @room.upload(@song)
    @room.upload(@another_song)
    @room.remove(@song)
    assert_equal([@another_song], @room.song_list)
  end

  def test_room_can_clear_song_list
    @room.upload(@song)
    @room.upload(@another_song)
    @room.clear_song_list
    assert_equal([], @room.song_list)
  end

  def test_room_can_check_if_it_is_empty__false
    @room.enter("guest")
    @room.enter("another_guest")
    assert_equal(false, @room.is_empty?)
  end

  def test_room_can_check_if_it_is_empty__true
    @room.enter("guest")
    @room.leave("guest")
    assert_equal(true, @room.is_empty?)
  end

  def test_room_can_find_song_by_name__on_list
    @room.upload(@song)
    assert_equal(@song, @room.find("Macarena"))
  end

  def test_room_can_find_song_by_name__not_on_list
    @room.upload(@song)
    assert_nil(@room.find("Hello"))
  end

  def test_room_can_play_song__on_list
    @room.upload(@song)
    @room.find("Macarena")
    assert_equal("Now playing Macarena", @room.play(@song))
  end

  def test_room_can_play_song__not_on_list
    @room.upload(@song)
    @room.find("Hello")
    assert_equal("Please choose another song", @room.play(@another_song))
  end









end
