=begin

name: String
bio: String

=end

class Author
    attr_accessor :name, :bio

    @@all = []

    def initialize(name:, bio:)
        @name = name
        @bio = bio
    end

    def self.all
        @@all
    end

    def self.count
        @@all.size
    end

    def save
        @@all << self
        self
    end

    def self.create(name:, bio:)
        author = Author.new(name: name, bio: bio)
        author.save
    end

    def articles
        Post.all.select {|post| post.author == self}
    end

    def article_count
        self.articles.size
    end

end
