class Complement
  Dna_nucleotides = 'CGAT'
  Rna_nucleotides = 'GCUA'
  private_constant :Dna_nucleotides, :Rna_nucleotides
  
  def self.of_dna(strand)
    strand.tr(Dna_nucleotides, Rna_nucleotides)
  end

  def self.of_rna(strand)
    strand.tr(Rna_nucleotides, Dna_nucleotides)
  end
end
