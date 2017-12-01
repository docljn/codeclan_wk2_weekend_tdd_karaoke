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
    @room.guest_list.delete(guest)
  end

end

# bar.rb
