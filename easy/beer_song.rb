# Generate the lyrics of the 99 bottles of beer song.
# Create BeerSong class.
# Create the class method verse that takes an argument , number
# The class method verse returns a string lyrics.

class BeerSong
  def self.verses(*nums)
    nums[0].downto(nums[-1]).map do |num|
      case num
      when 2 then two_bottle_verse
      when 1 then one_bottle_verse
      when 0 then zero_bottle_verse
      else
        default_verse(num)
      end
    end.join("\n")
  end

  def self.verse(verse_num)
    verses(*verse_num)
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    def default_verse(n)
      "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
    end

    def two_bottle_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def one_bottle_verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def zero_bottle_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
