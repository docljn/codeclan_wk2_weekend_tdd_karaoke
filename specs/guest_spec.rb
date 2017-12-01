

require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )



class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Petula")
  end

  def test_guest_has_name
    assert_equal("Petula", @guest.name)
  end

  def test_guest_has_favourite_song
    skip
  end

  def test_guest_sings
    skip
  end

  def test_guest_can_request_song
    skip
  end

  def test_guest_can_remove_song
    skip
  end



end
