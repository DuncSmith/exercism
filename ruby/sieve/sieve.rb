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
      numbers = SieveStep.new(numbers, prime).sieve
      prime = numbers.find { |n| n > prime }
    end
    numbers
  end

  class SieveStep
    def initialize(partially_sieved, next_prime)
      @numbers = partially_sieved
      @prime = next_prime
    end

    def sieve
      known_primes + candidate_primes.reject(&method(:multiple?))
    end

    private

    attr_reader :prime, :numbers

    def known_primes
      numbers.take_while { |n| n <= prime }
    end

    def candidate_primes
      numbers.drop_while { |n| n <= prime }
    end

    def multiple?(number)
      (number % prime) == 0
    end
  end
end
