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
    possible_primes = (2..limit)
    primes, possible_primes =
      sieve(primes || [], possible_primes) while possible_primes.any?
    primes
  end

  def sieve(primes, possible_primes)
    prime, *possible = *possible_primes
    [primes + [prime], possible.reject { |n| n % prime == 0 }]
  end
end
