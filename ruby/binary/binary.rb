class Binary
  def initialize(binary)
    @binary = binary
  end

  def to_decimal
    valid ? bit_values.reduce(:+) : 0
  end

  private

  attr_reader :binary

  def valid
    binary.chars.all? { |c| %w(0 1).include?(c) }
  end

  def bit_values
    bits.each_with_index.map { |b, n| b * 2**n }
  end

  def bits
    binary.reverse.chars.map(&:to_i)
  end
end
