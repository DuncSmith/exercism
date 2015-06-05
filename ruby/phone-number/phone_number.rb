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
    clean_number[:area_code]
  end

  def prefix
    clean_number[:prefix]
  end

  def line
    clean_number[:line]
  end

  private

  attr_reader :unclean_number

  def clean_number
    @clean_number ||= process_number
  end

  def process_number
    if unclean_number =~ phone_number_pattern
      {
        area_code: Regexp.last_match['area_code'],
        prefix: Regexp.last_match[:prefix],
        line: Regexp.last_match[:line]
      }
    else
      { area_code: '000', prefix: '000', line: '0000' }
    end
  end

  def phone_number_pattern
    /^\s*
     1?                     # optional US country code
     \(?                    # optional enclose area in parentheses
     (?<area_code>\d{3})
     \)?[-.\s]*             # optional separator
     (?<prefix>\d{3})
     [-.\s]*                # optional separator
     (?<line>\d{4})
     \s*$/x
  end
end
