require 'ostruct'
require 'forwardable'

class PhoneNumber
  extend Forwardable

  def initialize(number)
    @unclean_number = number
  end

  def number
    "#{area_code}#{prefix}#{line}"
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line}"
  end

  def_delegators :clean_number, :area_code, :prefix, :line

  private

  attr_reader :unclean_number, :number_match

  def clean_number
    @clean_number ||=
      OpenStruct.new(valid_number? ? matched_number : invalid_number)
  end

  def valid_number?
    return false unless unclean_number =~ phone_number_pattern
    @number_match = Regexp.last_match
  end

  def matched_number
    number_match.names.map { |n| [n.to_sym, number_match[n]] }.to_h
  end

  def invalid_number
    { area_code: '000', prefix: '000', line: '0000' }
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
