class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    song.name = name
    if self.find_by_name(name)
      self.find_by_name(name) # why is this line more complicated than seems like it should be?
    else self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted = @@all.sort_by{|song| song.name}
   sorted
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    
    name = parts[1].chomp(".mp3")
    artist_name = parts[0]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
        parts = filename.split(" - ")
    
    name = parts[1].chomp(".mp3")
    artist_name = parts[0]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
    @@all << song
  end
  
  def self.destroy_all
  
end
end
