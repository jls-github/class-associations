class Waiter
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
        self
    end

    def self.create(name)
        waiter = Waiter.new(name)
        waiter.save
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def customers
        self.meals.map {|meal| meal.customer}
    end

    def customer_count
        self.customers.size
    end

    def tips
        self.meals.map {|meal| meal.tip}
    end

    def average_tip
        total = self.tips.reduce(0) {|tip, sum| tip + sum }
        total / tips.count
    end

end