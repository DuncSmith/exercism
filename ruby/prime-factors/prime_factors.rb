require 'prime'

module PrimeFactors
  def self.for(number)
    factors = []
    Prime.each(number) do |prime|
      break if number < prime
      while number % prime == 0
        number /= prime
        factors << prime
      end
    end
    factors
  end
end
