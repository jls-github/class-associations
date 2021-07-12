require 'pry'

require_relative './student.rb'
require_relative './course.rb'

class Enrollment
    attr_accessor :student, :course

    @@all = []

    def initialize(student, course)
        @student = student
        @course = course
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(student, course)
        enrollment = Enrollment.new(student, course)
        enrollment.save
        enrollment
    end
end

geometry = Course.create("Geometry")
grammar = Course.create("English and Grammar Composition")
history = Course.create("History")

jeremiah = Student.create("Jeremiah")
cameron = Student.create("Cameron")
anna = Student.create("Anna")
lisa = Student.create("Lisa")

Enrollment.create(jeremiah, geometry)
Enrollment.create(jeremiah, history)

Enrollment.create(cameron, geometry)
Enrollment.create(cameron, grammar)
Enrollment.create(cameron, history)

Enrollment.create(anna, grammar)
Enrollment.create(anna, history)

Enrollment.create(lisa, history)

binding.pry