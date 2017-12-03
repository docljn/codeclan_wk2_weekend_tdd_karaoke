# bar.rb

require("pry")

class Bar

  attr_reader :name, :room

  def initialize(name, room)
    # rethinking if bar has more than one room?
    # maybe a hash instead of a single variable
    @name = name
    @room = room
  end

  def check_in(guest, room)
    room.enter(guest)
    if room.find(guest.favourite)
      guest.cheer
    end
  end

  def check_out(guest, room)
    # considered just taking guest as argument, but
    # guest may want to move from one room to another
    @room.leave(guest)
    # need to add charging
  end

  def add_song_list(room, songlist)
    songlist.each do |song|
      unless room.song_list.include?(song)
        room.upload(song)
      end
    end
  end

  def reset(room)
    if room.is_empty?
      room.clear_song_list
    end
  end

  def charge(guest, amount)
    if guest.can_afford?(amount)
      guest.spend(amount)
    else
      return "Refused service"
      # not sure if this is useful or not?
    end
  end


end

# bar.rb
