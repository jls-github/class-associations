require 'pry'
# import 'pry'

require_relative './waiter.rb'
# import './waiter.rb'
require_relative './customer.rb'

class Meal
    attr_accessor :customer, :waiter, :price, :tip

    @@all = []

    def initialize(customer:, waiter:, price:, tip:)
        @customer = customer
        @waiter = waiter
        @price = price
        @tip = tip
    end

    def self.all
        @@all
    end

    def save
        @@all << self
        self
    end

    def self.create(customer:, waiter:, price:, tip:)
        meal = Meal.new(customer: customer, waiter: waiter, price: price, tip: tip)
        meal.save
    end


end

johnny = Customer.create("Johnny")
cameron = Customer.create("Cameron")
alvee = Customer.create("Alvee")

chuck = Waiter.create("Chuck")
norris = Waiter.create("Norris")

johnny.have_meal(price: 1000, tip: 200, waiter: chuck)

Meal.create(customer: cameron, waiter: chuck, price: 1000, tip: 300)
Meal.create(customer: alvee, waiter: chuck, price: 1200, tip: 1000)

Meal.create(customer: alvee, waiter: norris, price: 4000, tip: 500)
Meal.create(customer: cameron, waiter: norris, price: 5000, tip: 1000)

binding.pry
