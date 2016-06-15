class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    file = file_name.split(/[-.]+/)
    song = self.new(file[1].strip)
    song.artist = Artist.find_or_create_by_name(file[0].strip)
    song.artist.add_song(song)
    song
  end
end