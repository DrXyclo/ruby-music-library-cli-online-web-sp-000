require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist_name = "", genre = [])
    @name = name
    
    self.genre=(genre)
    self.artist=(artist_name) # have to use self in front of setter instance or it won't execute, why?
    
    save
  end
  
  def self.create(name)
    @@all << Song.new(name)
  
    @@all.last
  
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist_name)
    @artist = artist_name
    if artist_name == ""
    elsif !self.artist.genres.include?(self.genre)
      artist_name.add_song(self)
    #  binding.pry
      self.artist.genres << self.genre
    end 
  end

  def genre=(genre)
    @genre = genre
    if self.genre.class == Array || self.genre.class == NilClass
    elsif !self.genre.songs.include?(self)
      self.genre.songs << self
    else 
    end

  end



    
end 

class Artist
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @genres = []
  #  binding.pry
    save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    @@all << Artist.new(name)
    @@all.last
  end
  
  def add_song(song)
    if song.artist == ""
      song.artist = self
      self.songs << song
    end 
  end
  

#  def genres
#    genres = []
#    if !self.genres.include?(genre)
#      self.genres << genre
#    end   

#  end
=begin 
    def artists
    artist_name = []
    self.all_songs.each do |all_songs|
      artist_name << all_songs.artist_name
    end
    artist_name
  end
  
  # the instance method artists initializes the artist_name variable as empty array and takes self, a genre instance, passed to it from the genre_spec line 47 and 48.  Self then iterates through each instance of a song returning the artist_name and putting into the artist_name array.  The method then returns the artist_name array which is asked in genre_spec line 50 and 51 if it includes? the jay_z and kendrick object + attributes, respectively. 
=end   
end 


class Genre ###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  
  @@all = []
  
  attr_accessor :name, :songs 
  
  def initialize(name)
    @name = name
    @songs = []
    save
  #  binding.pry
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    @@all << Genre.new(name)
    @@all.last
  end 
  
end
  

