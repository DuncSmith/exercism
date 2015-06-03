class Grains
  @squares = [0, 1]

  def self.square(number)
    @squares[number] ||= 2 * square(number-1)
  end

  def self.total
    (1..64).map(&method(:square)).reduce(:+)
  end
end
