# bar.rb

require("pry")

class Bar

  attr_reader :name, :room

  def initialize(name, room)
    @name = name
    @room = room
  end

  def check_in(guest, room)
    @room.enter(guest)
  end

  def check_out(guest, room)
    # considered just taking guest as argument, but
    # guest may want to move from one room to another
    @room.leave(guest)
  end

  def add_song_list(room, songlist)
    songlist.each do |song|
      unless room.song_list.include?(song)
        room.upload(song)
      end
    end
  end

end

# bar.rb
