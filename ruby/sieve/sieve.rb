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
    numbers = (2..limit).to_a
    while (multiple = prime = next_prime(numbers, prime))
      mark(numbers, multiple) until (multiple += prime) > limit
    end
    numbers.keep_if(&method(:unmarked?))
  end

  def next_prime(numbers, prime)
    return numbers[0] unless prime
    numbers.drop(prime - 1).find(&method(:unmarked?))
  end

  def mark(numbers, number)
    numbers[number - 2] = 0
  end

  def unmarked?(number)
    number > 0
  end
end
