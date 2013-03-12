require './lib/bike' # the class under test
require 'minitest/autorun' # the minitest itself
# require 'ansi' # makes it colored
# require 'turn' # improves the default output

class TestBike < MiniTest::Unit::TestCase

  def setup
    @bike = Bike.new
  end

  def test_bike_is_not_broken_by_default
    refute @bike.broken?
  end

  def test_bike_can_be_broken
    assert (@bike.break!).broken?
  end

  def test_breaking_bike_returns_bike
    assert @bike.break! == @bike
  end

  def test_bike_fixing_returns_bike
    assert @bike.fix! == @bike
  end

  def test_bike_can_be_fixed
    @bike.break!
    assert !(@bike.fix!).broken?
  end
end