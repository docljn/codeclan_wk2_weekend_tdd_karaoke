# guest.rb

require("pry")

class Guest

  attr_reader :name, :money, :favourite

  def initialize(args)
    @name = args[:name]
    @money = args[:money]
    @favourite = args[:favourite]
  end

  def can_afford?(amount)
    @money >= amount
  end

  def spend(amount)
    @money -= amount if can_afford?(amount)
  end

  def hooray
    return "Whoooo!"
  end

end

# guest.rb
