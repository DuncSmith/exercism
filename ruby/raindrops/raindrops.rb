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
    multiple_at_least_one? 3, 5, 7
  end

  def special_string
    pling + plang + plong
  end

  def ordinary_string
    number.to_s
  end

  def multiple_at_least_one?(*divisors)
    divisors.any? { |divisor| multiple? divisor }
  end

  def pling
    multiple?(3) ? 'Pling' : ''
  end

  def plang
    multiple?(5) ? 'Plang' : ''
  end

  def plong
    multiple?(7) ? 'Plong' : ''
  end

  def multiple?(divisor)
    (number % divisor).zero?
  end
end
