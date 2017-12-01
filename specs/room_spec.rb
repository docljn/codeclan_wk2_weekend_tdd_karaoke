

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

  def test_guest_can_enter_room
    # not using an actual guest at this point (no need to complicate things!)
    @room.enter("guest")
    assert_equal(["guest"], @room.guest_list )
  end

  def test_guest_can_leave_room
    @room.enter("guest")
    @room.enter("another_guest")
    @room.leave("guest")
    assert_equal(["another_guest"], @room.guest_list )
  end

  def test_room_can_upload_songs
    @room.upload("Macarena")
    assert_equal(["Macarena"], @room.song_list)
  end

  def test_room_can_remove_songs
    @room.upload("Macarena")
    @room.upload("Chirpy Chirpy Cheep Cheep")
    @room.remove("Macarena")
    assert_equal(["Chirpy Chirpy Cheep Cheep"], @room.song_list)
  end

  def test_room_can_clear_song_list
    @room.upload("Macarena")
    @room.upload("Chirpy Chirpy Cheep Cheep")
    @room.clear_song_list
    assert_equal([], @room.song_list)
  end


end
