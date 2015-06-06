class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    valid ? trit_values.reduce(:+) : 0
  end

  private

  attr_reader :trinary

  def valid
    trinary.chars.all? { |c| %w(0 1 2).include?(c) }
  end

  def trit_values
    trits.each_with_index.map { |b, n| b * 3**n }
  end

  def trits
    trinary.reverse.chars.map(&:to_i)
  end
end
