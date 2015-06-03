class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes || find_primes
  end

  private

  attr_reader :limit

  def find_primes
    remainder = numbers = (2..limit).to_a
    while remainder.any?
      prime = remainder.first
      remainder.drop(1).each do |n|
        mark(numbers, n) if multiple?(prime, n)
      end
      remainder = numbers.drop(prime - 1).reject(&method(:marked?))
    end
    numbers.reject(&method(:marked?))
  end

  def mark(numbers, number)
    numbers[number - 2] = 0
  end

  def marked?(number)
    number == 0
  end

  def multiple?(divisor, number)
    (number % divisor) == 0
  end
end
