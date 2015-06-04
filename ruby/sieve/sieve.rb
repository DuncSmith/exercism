class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes || sieve((2..limit).to_a, 2)
  end

  private

  attr_reader :limit

  def sieve(numbers, prime)
    return numbers unless prime
    known_primes = numbers.take_while { |n| n <= prime }
    candidate_primes = numbers.drop_while { |n| n <= prime }
    sieve(
      known_primes + candidate_primes.reject { |n| n % prime == 0 },
      numbers.find { |n| n > prime })
  end
end
