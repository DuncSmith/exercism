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
    prime = 2
    numbers = (prime..limit).to_a
    while prime
      numbers = sieve(numbers, prime)
      prime = numbers.find { |n| n > prime }
    end
    numbers
  end

  def sieve(numbers, prime)
    known_primes(numbers, prime) +
      candidate_primes(numbers, prime).reject { |n| (n % prime) == 0 }
  end

  def known_primes(values, limit)
    values.take_while { |n| n <= limit }
  end

  def candidate_primes(values, limit)
    values.drop_while { |n| n <= limit }
  end
end
