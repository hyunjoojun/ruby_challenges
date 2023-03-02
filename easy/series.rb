# Problem:
# Input: String of digits
# Output: Return all the numbers that can be formed with certain length in nested array
# The method takes one argument which is the length
# If the input length is greater than the string's length raise an error.
# Ex:
# string = '01234'
# length = 3
# output = [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
# Algorithm:
# Create Series class
# Create constructor method that takes one argument, string
# Create the instance method slices
# The slices method:
# - Convert the string into array with digits.
# - Iterate from 0 through array length - length given = This number is index
# array[index, length] to get the divided array
# push divided array into result array.

class Series
  attr_reader :str_numbers

  def initialize(string)
    @str_numbers = string
  end

  def slices(length)
    digits = str_to_digits
    raise ArgumentError if length > digits.size

    result = []
    0.upto(digits.size - length) do |index|
      result << digits[index, length]
    end
    result
  end

  private

  def str_to_digits
    str_numbers.chars.map(&:to_i)
  end
end
