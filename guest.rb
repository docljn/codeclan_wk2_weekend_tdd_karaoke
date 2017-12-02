# guest.rb

require("pry")

class Guest

  attr_reader :name, :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def spend(amount)
    @money -= amount if @money >= amount  
  end

end

# guest.rb
