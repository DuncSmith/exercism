class Nucleotide
  def self.from_dna(strand)
    Nucleotide.new(strand)
  end

  def initialize(strand)
    fail(ArgumentError, 'Invalid DNA strand') unless valid?(strand)
    @strand = strand
  end

  def count(nucleotide)
    (nucleotide_groups[nucleotide] || []).size
  end

  def histogram
    @histogram ||= valid_nucleotides.map { |n| [n, count(n)] }.to_h
  end

  private

  attr_reader :strand

  def nucleotide_groups
    @nucleotide_groups ||= strand.chars.group_by { |n| n }
  end

  def valid?(strand)
    strand.chars.all? { |n| valid_nucleotides.include?(n) }
  end

  def valid_nucleotides
    %w(A T C G)
  end
end
