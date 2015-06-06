require 'prime'

module PrimeFactors
  def self.for(number)
    Prime.each(number).each_with_object([]) do |prime, factors|
      break factors if number == 1
      factors << number && (break factors) if Math.sqrt(number) < prime
      factors << prime && number /= prime while number % prime == 0
    end
  end
end
