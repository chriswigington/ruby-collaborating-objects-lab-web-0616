class Artist
  attr_accessor :songs, :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    songs << song
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    artist = @@all.find do |artist|
      artist.name == artist_name
    end
    artist ||= self.new(artist_name)
    if @@all.include?(artist) == false
      artist.save
    end
    # self.all each do |artist|
    #   puts songs
    # end
    artist
  end
end