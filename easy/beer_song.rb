# Generate the lyrics of the 99 bottles of beer song.
# Create BeerSong class.
# Create the class method verse that takes an argument , number
# The class method verse returns a string lyrics.

class BeerSong
  def self.verses(*num)
    num[0].downto(num[-1]).map do |n|
      if n == 2
        "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n - 1} bottle of beer on the wall.\n"
      elsif n == 1
        "#{n} bottle of beer on the wall, #{n} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      elsif n.zero?
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
      end
    end.join("\n")
  end

  def self.verse(verse_num)
    verses(*verse_num)
  end

  def self.lyrics
    verses(99, 0)
  end
end
