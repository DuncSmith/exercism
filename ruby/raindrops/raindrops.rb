class Raindrops
  def self.convert(number)
    Raindrops.new(number).to_s
  end

  def initialize(number)
    @number = number
  end

  def to_s
    substituted? ? substituted_string : ordinary_string
  end

  private

  attr_reader :number

  def substituted?
    substitutions.any? { |divisor, _| multiple? divisor }
  end

  def substituted_string
    substitutions.map { |divisor, word| word if multiple? divisor }.join
  end

  def ordinary_string
    number.to_s
  end

  def multiple?(divisor)
    (number % divisor).zero?
  end

  def substitutions
    { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
  end
end
