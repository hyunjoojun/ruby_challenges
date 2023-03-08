# Problem:
# We have Clock object.
# We can add and subtract minutes from the time represented by Clock object.
# Do not mutate clock objects, create a new clock object when adding or subtracting.
# If two clocks have same time, they should be equal to each other.
# Do not use any built-in date or time methods.
# Format: string 'hour:minutes'
# Algorithm:
# Clock class has class method at that takes one or two arguments.
# The class method at returns time, but not in string.
# Create class method to_s that formats the number into string.
# The at method:
# - The first argument is the hour.
# - Second argument is minutes at adds to the hour.
# - 8 -> 8.00
# - 9 -> 9.00

class Clock
  attr_reader :hours, :minutes, :total_mins

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
    @total_mins = convert_to_min
  end

  def self.at(hour, min = 0)
    new(hour, min)
  end

  def +(other)
    @total_mins += other
    convert_to_hour
    self.class.new(hours, minutes)
  end

  def -(other)
    @total_mins -= other
    convert_to_hour
    self.class.new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    total_mins == other.total_mins
  end

  private

  def convert_to_min
    hours_to_mins = hours * 60
    hours_to_mins + minutes
  end

  def convert_to_hour
    @hours, @minutes = total_mins.divmod(60)
    @hours = hours % 24
  end
end
