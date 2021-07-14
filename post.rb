require 'pry'
require_relative './author.rb'

=begin

title: String
body: String
author: Author

=end

class Post
    attr_accessor :title, :body, :author

    @@all = []

    def initialize(title: "Default title", body:, author:)
        @title = title
        @body = body
        @author = author
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

    def self.create(title:, body:, author:)
        post = Post.new(title: title, body: body, author: author)
        post.save
    end
end

alvee = Author.create(bio: "This is the author's bio", name: "Alvee")
john = Author.create(bio: "This is the author's bio", name: "John")

first_article = Post.create(title: "First article", body: "This article will teach you to code well in Ruby", author: alvee)
second_article = Post.create(title: "Second article", body: "This article will teach you to code well in Python", author: alvee)
third_article = Post.create(title: "Third article", body: "This article will teach you to code well in Javascript", author: john)

binding.pry