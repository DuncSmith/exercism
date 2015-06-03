class Sieve
  def initialize(limit)
    @numbers = (2..limit).to_a
  end

  def primes
    @primes || find_primes
  end

  private

  attr_reader :numbers

  def find_primes
    remainder = numbers
    remainder = sieve(remainder) while remainder.any?
    numbers.reject(&method(:marked?))
  end

  def sieve(remainder)
    prime = remainder.first
    remainder.drop(1).each do |n|
      mark(n) if multiple?(prime, n)
    end
    numbers.drop(prime - 1).reject(&method(:marked?))
  end

  def mark(number)
    numbers[number - 2] = 0
  end

  def marked?(number)
    number == 0
  end

  def multiple?(divisor, number)
    (number % divisor) == 0
  end
end
