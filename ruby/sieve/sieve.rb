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
    numbers = ((prime = 2)..limit)
    (numbers, prime) = sieve(numbers, prime) while prime
    numbers
  end

  def sieve(numbers, prime)
    known_primes = numbers.take_while { |n| n <= prime }
    possible_primes = numbers.drop_while { |n| n <= prime }
                      .reject { |n| n % prime == 0 }
    [known_primes + possible_primes, possible_primes.first]
  end
end
