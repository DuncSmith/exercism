class Raindrops
  def self.convert(number)
    Raindrops.new(number).to_s
  end

  def initialize(number)
    @number = number
  end

  def to_s
    special? ? special_string : ordinary_string
  end

  private

  attr_reader :number

  def special?
    multiple_at_least_one? special_cases.keys
  end

  def special_string
    special_cases.keys.reduce('') do |text, divisor|
      text + (multiple?(divisor) ? special_cases[divisor] : '')
    end
  end

  def ordinary_string
    number.to_s
  end

  def multiple_at_least_one?(*divisors)
    divisors.flatten.any? { |divisor| multiple? divisor }
  end

  def multiple?(divisor)
    (number % divisor).zero?
  end

  def special_cases
    {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }
  end
end
