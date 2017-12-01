# room.rb

require("pry")

class Room

  attr_reader :name, :song_list, :guest_list

  def initialize(name)
    @name = name
    @song_list = song_list || []
    @guest_list = guest_list || []
  end

  def enter(guest)
    @guest_list << guest
  end

  def leave(guest)
    @guest_list.delete(guest)
  end

  def upload(song)
    @song_list << song
  end

  def remove(song)
    @song_list.delete(song)
  end

end

# room.rb
