# Write a program that determines if a triangle is equilateral, isosceles, or scalene.
# All triangles have 3 sides.
# Equilateral triangle has all 3 sides eqaul in length.
# Isosceles triangle has 2 same length sides and another side that is not equal in length.
# Scalene triangles have all different length sides.
# All sides' length must be greater than 0, and the sum of lengths of 2 sides has to be
# greater than the length of the 3rd side.

class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError unless valid_triangle(s1, s2, s3)
  end

  def kind
    if sides.count(sides[0]) == 3
      'equilateral'
    elsif sides.any? { |side| sides.count(side) == 2 }
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid_triangle(s1, s2, s3)
    case1 = [s1, s2, s3].all? { |side| side > 0 }
    case2 = s1 + s2 > s3
    case3 = s2 + s3 > s1
    case4 = s1 + s3 > s2

    case1 && case2 && case3 && case4
  end
end
