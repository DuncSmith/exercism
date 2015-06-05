class PhoneNumber
  def initialize(number)
    @unclean_number = number
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line}"
  end

  def area_code
    number[0, 3]
  end

  def prefix
    number[3, 3]
  end

  def line
    number[6, 4]
  end

  def number
    @number ||= valid_number? ? national_number : invalid_number
  end

  private

  attr_reader :unclean_number

  def valid_number?
    only_digits? && (national_us_number? || international_us_number?)
  end

  def national_number
    stripped_number[-10, 10]
  end

  def invalid_number
    '0000000000'
  end

  def only_digits?
    stripped_number.chars.all? { |c| ('0'..'9').include?(c) }
  end

  def national_us_number?
    stripped_number.size == 10
  end

  def international_us_number?
    stripped_number.size == 11 && stripped_number[0] == '1'
  end

  def stripped_number
    keep = ('0'..'9').to_a + ('a'..'z').to_a
    unclean_number.downcase.chars.keep_if { |c| keep.include?(c) }.join
  end
end
