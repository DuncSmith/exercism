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
    sieve(numbers, prime)
  end

  def sieve(numbers, prime)
    return numbers unless prime
    known_primes = numbers.take_while { |n| n <= prime }
    candidate_primes = numbers.drop_while { |n| n <= prime }
    sieve(
      known_primes + candidate_primes.reject { |n| n % prime == 0 },
      numbers.find { |n| n > prime })
  end
end
