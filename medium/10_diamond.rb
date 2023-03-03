# Problem:
# Input: A letter
# Output: A diamond shape with letters
# The input letter is the letter that is at the widest point of the diamond.
# The first and last row contains one 'A'
# All the rows except first and last have two identical letters.
# The diamond has a square shape meaning horizontally and vertically symmertric.
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in the descending order.
# The outside four corners (blank spaces) of the diamond shape are triangles.
# Algorithm:
# - Create Diamond class.
# - Create class method make_diamond that takes one argument (letter).
# - make_diamond method:
# - Set up a constant ('A'..'Z') so we know that the letters are in alphabetical order.
# - We can think of 'A' is 1, 'B' is 2 and so on.
# - For example, if we have letter 'C' which converts to 3.
# - We can start from the top half which contains 3 lines for 'C' diamond.
# - * Remember that this method returns a string
# - First we have to start with empty spaces on line 1 for 'C' diamond.
# - The empty space equals to the width - 1.
# - Set the empty_space = (' ' * width - 1)
# - First line = empty_space + the first letter 'A' + empty_space.
# - Second line = We have to decrement width so that we have less empty space.
# - So second line = empty_space(after decrement) + 'B B' + empty_space
# - Third line = empty_space + 'C  C' + empty_space
# - This should be the top half of the diamond.

class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    result = []
    width = LETTERS.index(letter) + 1
    space_length = width - 1
    first_last_line = "#{(' ' * space_length)}#{LETTERS[0]}#{(' ' * space_length)}"
    return first_last_line + "\n" if letter == 'A'

    result << first_last_line
    middle_space = 1

    1.upto(space_length) do |index|
      space_length -= 1
      result << "#{(' ' * space_length)}#{LETTERS[index]}#{(' ' * middle_space)}#{LETTERS[index]}#{(' ' * space_length)}"
      middle_space += 2
    end

    middle_space -= 2

    (width - 2).downto(1) do |index|
      space_length += 1
      middle_space -= 2
      result << "#{(' ' * space_length)}#{LETTERS[index]}#{(' ' * middle_space)}#{LETTERS[index]}#{(' ' * space_length)}"
    end
    result << first_last_line + "\n"
    result.join("\n")
  end
end
