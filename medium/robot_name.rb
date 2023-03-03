# Problem:
# We have robots that have no name.
# When we boot them up, a random name is generated with two capital letters and random
# 3 digits of numbers.
# When we reset robot to factory settings, name gets wiped.
# Next time we boot them up, they get a new name.
# The name have to be random, and it cannot be used twice.
# Algorithm:
# - Create Robot class
# - The instance method name assigns a new name to the robot.
# - When we instantiate a robot object, there is no name.
# - The name method:
# - We have to generate random robot name.
# - Starts with two capital letters
# - Ends with 3 digit numbers
# - ('A'..'Z').to_a for letters
# - (0..9).to_a for digits
# - We should mutate the original array so that we don't get the same name twice.
# - The name method should return the new name

class Robot
  @@existing_names = []

  def name
    return @name if @name

    new_name = create_name
    if @name.nil? && !duplicate?(new_name)
      @name = new_name
    else
      @name = create_name
    end
    @name
  end

  def create_name
    current_name = (two_random_letters + random_three_digits).join
    @@existing_names << current_name
    current_name
  end

  def duplicate?(name)
    @@existing_names.include?(name)
  end

  def reset
    @name = nil
  end

  def two_random_letters
    letters = ('A'..'Z').to_a
    two_letters = []
    2.times { two_letters << letters.shuffle!.pop }
    two_letters
  end

  def random_three_digits
    numbers = (0..9).to_a
    three_digits = []
    3.times { three_digits << numbers.shuffle!.pop }
    three_digits
  end
end
