class BaseN
  def initialize(base_value, base)
    @base_value = base_value
    @base = base
    validate_initialization
  end

  def to_decimal
    valid ? digit_values.reduce(:+) : 0
  end

  private

  attr_reader :base_value, :base

  def valid
    base_value.chars.any? &&
      base_value.chars.all? { |c| valid_chars.include?(c) }
  end

  def valid_chars
    (0...base).map(&:to_s)
  end

  def digit_values
    digits.each_with_index.map { |b, n| b * base**n }
  end

  def digits
    base_value.reverse.chars.map(&:to_i)
  end

  def validate_initialization
    return unless base < (min = 2) || base > (max = 10)
    fail(ArgumentError, "Base must be between #{min} and #{max}")
  end
end

class Trinary < BaseN
  def initialize(trinary)
    super(trinary, 3)
  end
end
