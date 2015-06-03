class Hamming
  VERSION = 1
  
  def self.compute(strand, other)
    Hamming.new(strand, other).distance
  end

  def initialize(strand, other)
    @strand = strand
    @other = other
    validate
  end

  def distance
    positional_pairs.count { |a, b| a != b }
  end

  private

  attr_reader :strand, :other

  def validate
    throw "Strand lengths differ" if strand.size != other.size
  end

  def positional_pairs
    strand.chars.zip(other.chars).take(other.size)
  end
end
