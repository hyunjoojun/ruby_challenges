# Write a program that calculate the Hamming distance between two DNA strands.
# DNA strands consists of 'C', 'A', 'G', and 'T' letters.
# Any letters that doesn't match when comparing the two strands will count as
# the Hamming distance.
# The two DNA strands are equal in length, if they are not equal in length,
# count upto the shorter lengh DNA.

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(new_strand)
    shortest_length = shortest_length(new_strand)
    differences = 0
    0.upto(shortest_length - 1) do |index|
      differences += 1 if strand[index] != new_strand[index]
    end
    differences
  end

  private

  def shortest_length(new_strand)
    strand.size >= new_strand.size ? new_strand.size : strand.size
  end
end
