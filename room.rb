# room.rb

require("pry")

class Room

  attr_reader :name, :song_list, :guest_list, :capacity

  def initialize(args)
    @name = args[:name]
    @capacity = args[:capacity]
    # .fetch returns the value of the specified key, or the optional default if the key cannot be found.
    @song_list = args.fetch(:song_list, [])
    @guest_list = args.fetch(:guest_list, [])
  end

  def enter(guest)
    if @guest_list.length < @capacity
      @guest_list << guest
    end
    # consider what to do with the guest at this point if the room is full?
  end

  def leave(guest)
    @guest_list.delete(guest)
  end

  def is_empty?
    @guest_list.length == 0
  end

  def upload(song)
    @song_list << song
  end

  def remove(song)
    @song_list.delete(song)
  end

  def clear_song_list
    @song_list.clear
  end

  def find(song_name)
    @song_list.each do |song|
      return song if song.name == song_name
    end
    return nil
  end

  def play(song)
    # how can I reduce the risk that changing 'song' will break 'room'?
    if @song_list.include?(song)
      return "Now playing #{song.name}"
    else
      return "Please choose another song"
    end
  end

end

# room.rb
