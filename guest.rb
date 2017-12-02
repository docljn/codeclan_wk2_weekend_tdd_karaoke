# guest.rb

require("pry")

class Guest

  attr_reader :name, :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def can_afford?(amount)
    @money >= amount
  end

  def spend(amount)
    @money -= amount if can_afford?(amount)
  end

end

# guest.rb
