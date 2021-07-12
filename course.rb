class Course
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name)
        course = Course.new(name)
        course.save
        course
    end

    def enrollments
        Enrollment.all.filter {|enrollment| enrollment.course == self}
    end

    def students
        self.enrollments.map {|enrollment| enrollment.student}
    end
end