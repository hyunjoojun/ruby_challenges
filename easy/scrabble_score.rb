# Problem:
# Input: A string (word)
# Ouput: Score
# According to the score tile, we have to split the word into letters
# and add up all the scores by the value of each letters.
# Algorithm:
# We are creating the Scrabble class
# The constructor method takes one argument (string)
# The score instance method converts the word into the total score.
# - Constructor:
# - Take the word and upcase the word.
# - The score method:
# - We have to convert the table into a structure so that we know the value of each letter.
# - Create a hash for values.
# - Once we have all the values, we can add them up to get the total.

class Scrabble
  attr_reader :word

  SCORE_TABLE = {
    A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1,
    D: 2, G: 2, B: 3, C: 3, M: 3, P: 3, F: 4, H: 4, V: 4, W: 4,
    Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10
  }.freeze

  def initialize(word)
    @word = word.nil? ? nil : word.upcase
  end

  def score
    score = 0
    return score if word.nil?

    word.chars do |char|
      score += char =~ /[A-Z]/ ? SCORE_TABLE[char.to_sym] : 0
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
