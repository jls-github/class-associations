class Student
    
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
        student = Student.new(name)
        student.save
        student
    end

    def enrollments
        Enrollment.all.filter {|enrollment| enrollment.student == self}
    end

    def courses
        self.enrollments.map {|enrollment| enrollment.course }
    end

end