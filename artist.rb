=begin

Artist Class

name - String
bio - String
picture_link - String

=end

class Artist

    attr_accessor :name, :bio, :picture_link

    @@all = []

    def initialize(name, bio, picture_link)
        @name = name
        @bio = bio
        @picture_link = picture_link
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name, bio, picture_link)
        artist = Artist.new(name, bio, picture_link)
        artist.save
        artist
    end

    def songs
        Song.all.filter {|song| song.artist == self}
    end

    def write_song(name, genre, release_date)
        song = Song.create(name, genre, release_date, self)
    end
end