class Hamming
  VERSION = 1

  def self.compute(strand, other)
    Hamming.new(strand, other).distance
  end

  def initialize(strand, other)
    @strand = strand
    @other = other
  end

  def distance
    validate
    positional_pairs.count { |a, b| a != b }
  end

  private

  attr_reader :strand, :other

  def validate
    fail(ArgumentError, 'Strand lengths differ') unless sizes_match?
  end

  def sizes_match?
    strand.size == other.size
  end

  def positional_pairs
    strand.chars.zip(other.chars)
  end
end
