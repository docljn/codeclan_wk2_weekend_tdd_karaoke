# room.rb

require("pry")

class Room

  attr_reader :name, :song_list, :guest_list

  def initialize(name)
    @name = name
    @song_list = song_list || []
    @guest_list = guest_list || []
  end

end

# room.rb
