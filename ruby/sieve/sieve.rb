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
    known_primes = numbers.take_while { |n| n <= prime }
    candidate_primes = numbers.drop_while { |n| n <= prime }
    multiple = ->(n) { (n % prime) == 0 }
    known_primes + candidate_primes.reject(&multiple)
  end
end
