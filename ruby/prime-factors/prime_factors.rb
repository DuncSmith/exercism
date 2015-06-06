require 'prime'

module PrimeFactors
  def self.for(number, factors = [], primes = Prime.each(number))
    return factors if number == 1
    prime = primes.next
    return factors + [number] if Math.sqrt(number) < prime
    self.for(*factor_by_prime(number, factors, prime), primes)
  end

  class << self
    private

    def factor_by_prime(number, factors, prime)
      return [number, factors] unless number % prime == 0
      factor_by_prime(number / prime, factors + [prime], prime)
    end
  end
end
