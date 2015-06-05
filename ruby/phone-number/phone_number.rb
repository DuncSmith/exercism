class PhoneNumber
  def initialize(number)
    @unclean_number = number
  end

  def number
    "#{area_code}#{prefix}#{line}"
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line}"
  end

  def area_code
    clean_number[-10, 3]
  end

  def prefix
    clean_number[-7, 3]
  end

  def line
    clean_number[-4, 4]
  end

  private

  attr_reader :unclean_number

  def clean_number
    @clean_number ||= valid_number? ? stripped_number : invalid_number
  end

  def valid_number?
    only_digits? && (national_us_number? || international_us_number?)
  end

  def national_us_number?
    stripped_number.size == 10
  end

  def international_us_number?
    stripped_number.size == 11 && stripped_number[0] == '1'
  end

  def only_digits?
    stripped_number.chars.all? { |c| ('0'..'9').include?(c) }
  end

  def stripped_number
    keep = ('0'..'9').to_a + ('a'..'z').to_a
    unclean_number.downcase.chars.keep_if { |c| keep.include?(c) }.join
  end

  def invalid_number
    '0000000000'
  end
end
