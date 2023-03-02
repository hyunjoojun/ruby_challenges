# Problem:
# Input: an integer and set of numbers
# Output: sum of all the multiples in the set but less than first input integer
# If there is no set of numbers, use default set of 3 and 5.
# If the input number is 20, and use default set:
# we get 3, 5, 6, 9, 10, 12, 15, and 18
# The sum is 78.
# Algorithm:
# Create a SumOfMultiples class
# Create a class method to that takes the integer as an argument.
# The class method uses the default set 3 and 5.
# Create an instance method to that takes the integer as an argument.
# The instance method uses the set provided.
# Create the constructor method that takes multiple numbers which are the set
# The to method:
# - The argument is the max number.
# - Itererate from 1 to max_number, but do not include the max number.
# - Select the number if the current number is the multiples of the set of numbers.
# - How do we know if it's the multiples of the set numbers?
# - If current number % any set of number equals to 0, it's the multiple.
# - We add all the multiples after selecting all the multiples.
# - Return the sum.

class SumOfMultiples
  attr_reader :set

  def initialize(*nums)
    @set = nums
  end

  def self.to(max_num)
    new(3, 5).to(max_num)
  end

  def to(max_num)
    (1...max_num).select do |number|
      set.any? { |num| (number % num).zero? }
    end.sum
  end
end
