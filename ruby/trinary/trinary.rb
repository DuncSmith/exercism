require 'set'

class BaseN
  def initialize(base_value, base, digit_value_map = nil)
    @base_value = base_value
    @base = base
    @digit_value_map = digit_value_map || default_digit_value_map
    validate_initialization
  end

  def to_decimal
    @decimal ||= valid ? column_values.reduce(:+) : 0
  end

  private

  attr_reader :base_value, :base, :digit_value_map

  def valid
    digits.any? && digits.all? { |c| valid_digits.include?(c) }
  end

  def column_values
    digit_values.each_with_index.map { |v, n| v * base**n }
  end

  def digit_values
    digits.map { |d| digit_value_map[d] }
  end

  def digits
    base_value.reverse.chars
  end

  def valid_digits
    digit_value_map.keys
  end

  def default_digit_value_map
    default_digits.map do |d|
      [d, d < 'A' ? d.to_i : 10 + d.ord - 'A'.ord]
    end.to_h
  end

  def default_digits
    ('0'..'9').take(base) +
      (base > 10 ? ('A'..'Z').take(base - 10) : [])
  end

  def validate_initialization
    validate_digit_value_map
    validate_base
  end

  def validate_digit_value_map
    validate_digit_value_map_values
    validate_digit_value_map_distinct_values
  end

  def validate_digit_value_map_values
    required_values = (0...base).to_set
    included_values = digit_value_map.values.to_set
    return unless (required_values - included_values).any?
    fail(
      ArgumentError,
      "Digit-value map must have all values between 0 and #{base - 1}")
  end

  def validate_digit_value_map_distinct_values
    return if digit_value_map.values.to_set.size == digit_value_map.size
    fail(ArgumentError, 'Digit-value map contains duplicate values')
  end

  def validate_base
    min_base = 1
    max_base = digit_value_map.size
    return unless base < min_base || base > max_base
    fail(
      ArgumentError, "Base must be between #{min_base} and #{max_base}")
  end
end

class Trinary < BaseN
  def initialize(trinary)
    super(trinary, 3)
  end
end
