# Write some code that converts modern decimal numbers into their Roman number equivalents.
# I stands for 1
# V stands for 5
# X stands for 10
# L stands for 50
# C stands for 100
# D stands for 500
# M stands for 1000
# Don't worry about numbers higher than 3000.

class RomanNumeral
  attr_reader :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_num = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_num += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_num
  end
end
