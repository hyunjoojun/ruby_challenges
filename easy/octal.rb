# Problem:
# Input: Octal input string
# Output: Decimal
# Invalid input: octal 0
# '10' -> 1*8^1 + 0*8^2 => 8
# '233' -> 2*8^2 + 3*8^1 + 3*8^0 => 155
# Octal numbers only include 0-7
# Algorithm:
# Create the Octal class.
# Create instance method to_decimal
# Create the constructor method that takes one argument (string)
# to_decimal method:
# - Take the string and split into digits.
# - Convert the digits into integers.
# - Iterate through the integer, get the array of digits size and take away 1.
# - Initialize the power = array_size - 1
# - 8**power then multiply the digit.
# - Save this value to an empty array to get the sum later.
# - decrement the power as we iterate through the digits.
# - After the iteration is over, sum the multiplied numbers.

class Octal
  attr_reader :num

  def initialize(string)
    @num = string
  end

  def octal_digits
    num.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if num.match?(/[^0-7]/)

    digits = octal_digits
    power = digits.size - 1
    result = []
    digits.each do |digit|
      result << digit * (8**power)
      power -= 1
    end
    result.sum
  end
end
