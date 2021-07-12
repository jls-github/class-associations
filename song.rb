require 'pry'
require 'date'
require_relative './artist.rb'

=begin

Song Class:
name - String
genre - String
artist - Artist
release_date - DateTime

=end

class Song
    
    attr_accessor :name, :genre, :release_date, :artist

    @@all = []

    def initialize(name, genre, release_date, artist)
        @name = name
        @genre = genre
        @release_date = release_date
        @artist = artist
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name, genre, release_date, artist)
        song = Song.new(name, genre, release_date, artist)
        song.save
        song
    end
    
    def destroy
        @@all = @@all.filter {|song| song != self}
        # self.artist.songs = self.artist.songs.filter {|song| song != self}
        song
    end

    # def artist
    #     Artist.all.find do |artist|
    #         artist.songs.include?(self)
    #     end
    # end
end

post_malone = Artist.create("Post Malone", "Post Malone is an artist. He's really good", "www.picturelink.com")
head_and_the_heart = Artist.create("Head and the Heart", "They sing Honeybee", "www.otherpicturelink.com")
# Song.create("Sunflower", "pop", post_malone, DateTime.now)
# Song.create("Circles", "pop", post_malone, DateTime.now)

post_malone.write_song("Sunflower", "pop", DateTime.now)
post_malone.write_song("Circles", "pop", DateTime.now)

# post_malone.songs[0].destroy

binding.pry