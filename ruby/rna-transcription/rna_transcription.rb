class Complement
  def self.of_dna(strand)
    validate_dna(strand)
    strand.tr(dna_nucleotides, rna_nucleotides)
  end

  def self.of_rna(strand)
    validate_rna(strand)
    strand.tr(rna_nucleotides, dna_nucleotides)
  end

  class << self
    private

    def validate_dna(strand)
      return if validate(strand, dna_nucleotides)
      fail(ArgumentError, 'Invalid DNA strand')
    end

    def validate_rna(strand)
      return if validate(strand, rna_nucleotides)
      fail(ArgumentError, 'Invalid RNA strand')
    end

    def validate(strand, nucleotides)
      strand.chars.all? { |c| nucleotides.include? c }
    end

    def dna_nucleotides
      'CGAT'
    end

    def rna_nucleotides
      'GCUA'
    end
  end
end
