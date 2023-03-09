# Start 11:37 AM
# End 12:33 PM
# Problem:
# We have to return year, month, day date according to the input strings.
# The input has the year and a month.
# It will also have days of the week : 'Monday', 'Tuesday' and so on.
# It will also have 'first', 'second', and 'teenth'
# 'teenth' is made up word for the days that ends with 'teenth'
# 13 through 19 will end up with 'teenth'
# Algorithm:
# Create Meetup class
# The constructor method should have 2 arguments, year and month.
# We should require date because the day method should return a date object.
# Create day instance method.
# The day method takes two arguments, days of the week(Mon, Tues) and sequence(1st, 2nd..)
# as strings.
# The strings are not case-sensitive: 'MONDAY' is equal to 'monday'
# Iterate from 1 through 31 and check each date if it's monday.
# If it's monday, make new array of days.
# if the second string is first, return the first element as a day.
require 'date'

class Meetup
  SCHEDULE = ['first', 'second', 'third', 'fourth', 'fifth']

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    valid_days = []
    1.upto(31) do |day|
      t = Time.local(@year, @month, day)
      valid_days << day if right_weekday?(t, weekday)
    end
    the_day = right_schedule(valid_days, schedule)
    return the_day if the_day.nil?

    return_valid_date(the_day, valid_days)
  end

  def return_valid_date(the_day, valid_days)
    if valid_day?(Time.local(@year, @month, the_day))
      Date.civil(@year, @month, the_day)
    else
      Date.civil(@year, @month, valid_days[-2])
    end
  end

  def valid_day?(time)
    time.month == @month
  end

  def right_weekday?(time, weekday)
    case weekday.downcase
    when 'monday' then time.monday?
    when 'tuesday' then time.tuesday?
    when 'wednesday' then time.wednesday?
    when 'thursday' then time.thursday?
    when 'friday' then time.friday?
    when 'saturday' then time.saturday?
    when 'sunday' then time.sunday?
    end
  end

  def right_schedule(array, schedule)
    case schedule.downcase
    when 'last' then array.last
    when 'teenth' then select_teenth(array)
    else
      array[SCHEDULE.index(schedule.downcase)]
    end
  end

  def select_teenth(array)
    array.select { |num| (13..19).to_a.include?(num) }.first
  end
end
