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
    song.save
    song
  end  
  
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end  
  
  def self.create_by_name(songStr)
    song = new_by_name(songStr)
    song.save
    song
  end  
  
  def self.find_by_name(songStr)
      Song.all.find {|song| song.name == songStr}
  end
  
  def self.find_or_create_by_name(songStr)
    if self.find_by_name(songStr) == nil 
      self.create_by_name(songStr)
    else 
      self.find_by_name(songStr)
    end
  end  
  
  def self.alphabetical 
    Song.all.sort_by {|song| song.name}
  end  
  
  def self.new_from_filename(fileNameArg)
    song = Song.new
    # new_artist_name = fileNameArg.split("-").first.strip
    # new_name = fileNameArg.split("-").last.strip.chomp(".mp3")
    song.artist_name = fileNameArg.split("-").first.strip
    song.name = fileNameArg.split("-").last.strip.chomp(".mp3")
  end  

end
