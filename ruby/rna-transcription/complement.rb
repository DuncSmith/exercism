class Complement
  def self.of_dna(strand)
    translate_strand(dna_rna_map, strand)
  end

  def self.of_rna(strand)
    translate_strand(rna_dna_map, strand)
  end

  class << self
    private

    def translate_strand(map, strand)
      translate_array(map, strand.split('')).join('')
    end
    
    def translate_array(map, nucleotides)
      map.values_at(*nucleotides)
    end
  
    def dna_rna_map
      {'C' => 'G', 'G' => 'C', 'A' => 'U', 'T' => 'A'}
    end

    def rna_dna_map
      dna_rna_map.invert
    end
  end
end
