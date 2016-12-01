require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    @@all << self.new
    @@all.last
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
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end


  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    new_file = filename.split(" - ")
    song = self.new
    song.artist_name = new_file[0]
    song.name = new_file[1]
    song.save
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    new_file = filename.split(" - ")
    song = self.new
    song.artist_name = new_file[0]
    song.name = new_file[1]
    song.save
  end

  def self.destroy_all
    @@all.clear
  end



end
