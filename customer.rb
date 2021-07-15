class Customer
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @all
    end

    def save
        @@all << self
        self
    end

    def self.create(name)
        customer = Customer.new(name)
        customer.save
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        self.meals.map {|meal| meal.waiter}
    end

    def tips
        self.meals.map {|meal| meal.tip}
    end

    def average_tip
        total = self.tips.reduce(0) {|tip, sum| tip + sum }
        total / tips.count
    end

    def have_meal(price:, tip:, waiter:)
        Meal.create(price: price, tip: tip, waiter: waiter, customer: self)
    end

end