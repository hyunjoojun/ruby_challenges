class Translation
  CODON_TO_AMINO = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    CODON_TO_AMINO.keys.each do |key|
      return CODON_TO_AMINO[key] if key.include?(codon)
    end
  end

  def self.of_rna(strand)
    result = []
    codon_array = split_strand(strand)
    aminos_array = codons_to_aminos(codon_array)

    aminos_array.each do |amino|
      break if amino == 'STOP'

      result << amino
    end
    result
  end

  class << self
    def split_strand(strand)
      codon_array = []
      codon_array << strand.slice!(0, 3) until strand.empty?
      codon_array
    end

    def codons_to_aminos(codons)
      codons.map do |codon|
        of_codon(codon)
      end
    end
  end
end
