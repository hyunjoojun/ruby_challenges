# Problem:
# Input: An integer
# Output: 'abundant', 'perfect' or 'deficient' strings
# Create a method that takes one argument, integer which will return a string.
# We have to get the divisors that will evenly divide the input number.
# Add all the divisors and if that aliquot sum is equal to the number, return 'perfect'
# If the aliquot sum is less than the number return 'deficient'
# If the aliquot sum is greater than the number return 'abundant'
# The divisors will include 1 but not itself.
# Raises StandardError if number is negative (less than 0)
# Algorithm:
# Create the PerfectNumber class
# Create the class method classify which returns the string
# The classify method takes an argument which is the input integer
# classify method:
# We have to iterate through 1 through input number - 1.
# If those numbers are evenly divisible divisors, they are selected.
# Add up all the selected numbers to get the aliquot sum.
# Compare the aliquot sum to the original input number.
# If they are equal, reuturn 'perfect'
# If the aliquot sum is less than the number return 'deficient'
# If the aliquot sum is greater than the number return 'abundant'

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    compare_two_nums(aliquot_sum(num), num)
  end

  class << self
    private

    def aliquot_sum(num)
      (1...num).select do |divisor|
        (num % divisor).zero?
      end.sum
    end

    def compare_two_nums(aliquot_sum, num)
      if aliquot_sum == num
        'perfect'
      elsif aliquot_sum < num
        'deficient'
      elsif aliquot_sum > num
        'abundant'
      end
    end
  end
end
