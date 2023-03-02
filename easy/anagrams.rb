# problem:
# input: a string(word) and an array of possible anagrams(words)
# output: An array of anagrams(words)
# What are anagrams? : When we rearrange the letters in different order, we should be
# able to make the input word.
# We have to use all the letters.
# Capital letters?
# Repeated letters?
# Empty spaces?
# algorithm:
# - We should create Anagram class
# - When we instantiate an anagram object, we should pass in one argument (word in string)
# - We should have the match instance method that takes an array as the argument.
# - The match method should return an array with anagrams.
# Algorithm for the match method:
# - Make a copy of the input word.
# - Iterate through all the candidates first.
# - Take the candidate word and split into letters.
# - Iterate through the letters.
# ex: 'listen'
# ['inlets', 'google']
# => ['inlets']
# For the first i, check if the original word contains the 'i'
# if it does we should substitute the input word's letter with empty string ''.
# After the iteration, If the copy of the original word is empty, that confirms it's the
# anagram. So that word gets into the result array.
# After the iteration is over, return the result array.

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def different_words?(candidate)
    @word != candidate.downcase
  end

  def match(list)
    detector = @word.clone
    duplicate = false
    result = []
    list.each do |candidate|
      candidate.chars.each do |char|
        substitue = detector.sub!(char.downcase, '')
        duplicate = true if substitue.nil?
      end
      result << candidate if detector.empty? && !duplicate && different_words?(candidate)
      detector = @word.clone
      duplicate = false
    end
    result
  end
end
