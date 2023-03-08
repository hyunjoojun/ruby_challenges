# Problem:
# When robot is created, they have no name.
# When we boot them up, a random name is generated.
# The robot name starts with 2 letters and ends with 3 digit numbers.
# We need to reset the robot to factory settings this will delete the name.
# Next time when we boot them up, a new name is assigned.
# Names must be random.
# All robots have different names (Cannot be the same)
# Algorithm:
# Create Robot class
# Create instance method name that generates the random name.
# When new robot is instantiated, there is no name.
# The name method should return name if there is name already.
# If name is nil, generate new name.
# Constructor method:
# No arguments needed, should have @name = nil
# Name method:
# - If name is nil, generate new name.
# - If name is truthy, return name.
# - Generating name..
# - Two random letters
# - Three random numbers
# - Combine them together.

class Robot
  @@names = []

  def initialize
    @name = nil
  end

  def name
    return @name if @name

    new_name = generate_name while @@names.include?(new_name)
    @@names << new_name
    @name = new_name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    two_random_letters + three_random_digits
  end

  def two_random_letters
    letters = ('A'..'Z').to_a
    two_letters = ''
    2.times { two_letters << letters.shuffle.pop }
    two_letters
  end

  def three_random_digits
    digits = (0..9).to_a
    three_digits = []
    3.times { three_digits << digits.shuffle.pop }
    three_digits.join
  end
end
