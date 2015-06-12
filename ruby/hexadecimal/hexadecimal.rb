class Hexadecimal
  def initialize(hex_value)
    @hex_value = hex_value
  end

  def to_decimal
    @decimal ||= valid ? column_values.reduce(:+) : 0
  end

  private

  attr_reader :hex_value

  def valid
    digits.any? && digits.all? { |c| valid_digits.include?(c.upcase) }
  end

  def column_values
    digit_values.each_with_index.map { |v, n| v * 16**n }
  end

  def digit_values
    digits.map { |d| digit_value_map[d.upcase] }
  end

  def digits
    hex_value.reverse.chars
  end

  def digit_value_map
    @digit_value_map ||= valid_digits.map do |digit|
      [digit, digit_value(digit)]
    end.to_h
  end

  def valid_digits
    @digits ||= ('0'..'9').to_a + ('A'..'F').to_a
  end

  def digit_value(digit)
    digit < 'A' ? digit.to_i : 10 + digit.ord - 'A'.ord
  end
end
