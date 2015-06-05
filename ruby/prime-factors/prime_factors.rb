require 'prime'

module PrimeFactors
  def self.for(n)
    Prime.each(n).lazy.take_while { |_| n > 1 }.reduce([]) do |a, p|
      (fs, n) = (f = lambda do |m|
        m % p == 0 ? ((c, m) = f[m / p]) && [c + [p], m] : [[], m]
      end)[n]
      a + fs
    end
  end
end
