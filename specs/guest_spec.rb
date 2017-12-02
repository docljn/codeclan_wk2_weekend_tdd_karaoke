

require("minitest/autorun")
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )



class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Petula", 40)
  end

  def test_guest_has_name
    assert_equal("Petula", @guest.name)
  end

  def test_guest_has_money
    assert_equal(40, @guest.money)
  end

  def test_guest_can_spend_money
    @guest.spend(10)
    assert_equal(30, @guest.money)
  end

  def test_guest_money_cannot_go_negative
    @guest.spend(45)
    assert_equal(40, @guest.money)
  end

  def test_guest_can_afford_charge
    assert_equal(false, @guest.can_afford?(100))
  end

  def test_guest_has_favourite_song
    skip
  end

  def test_guest_sings_favourite_song
    skip
  end

  def test_guest_can_request_song
    skip
  end

  def test_guest_can_remove_song
    skip
  end




end
