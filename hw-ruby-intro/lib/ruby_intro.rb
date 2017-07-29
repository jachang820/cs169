# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.inject(0,:+)
end

def max_2_sum arr
  arr.sort.last(2).inject(0,:+)
end

def sum_to_n? arr, n
  arr.combination(2).to_a.any? { |s| s.inject(0,:+) == n }
end

# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  s =~ /^[^AEIOU\W\d_](.*)/i
end

def binary_multiple_of_4? s
  s =~ /^([01]*00|0)$/
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    raise ArgumentError unless 
      isbn.length > 0 && price > 0
    @isbn, @price = isbn, price
  end
  attr_accessor :isbn, :price
  def price_as_string
    "$%.2f" % @price
  end
end
