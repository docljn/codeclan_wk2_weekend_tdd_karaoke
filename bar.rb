# bar.rb

require("pry")

class Bar

  attr_reader :name, :room

  def initialize(name, room)
    @name = name
    @room = room
  end

  def check_in(guest, room)
    @room.guest_list << guest
  end

  def check_out(guest, room)
    # considered just taking guest as argument, but
    # guest may want to move from one room to another 
    @room.guest_list.delete(guest)
  end

end

# bar.rb
